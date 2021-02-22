import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:grpc/grpc.dart';

Container getTitleWidget(String text, {TextStyle textStyle, Color textColor = Colors.blue, EdgeInsets margin}) {
  return Container(
    margin: margin == null ? EdgeInsets.only(top: 10.0, left: 10.0) : margin,
    child: Text(
      text,
      style: textStyle == null ? TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: textColor) : textStyle,
    ),
  );
}

Row getUserProfileWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 20.0,
          backgroundImage: AppUser.isAuthenticated() ? NetworkImage(AppUser.profileImageUrl) : AssetImage("assets/placeholder_avatar.jpg"),
        ),
      ),
      SizedBox(
        width: 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(AppUser.isAuthenticated() ? AppUser.displayName : "Sign in", style: TextStyle(fontSize: 20.0, color: Colors.black)),
          Text(
            AppUser.isAuthenticated() ? AppUser.email : "Go to menu",
            style: GoogleFonts.lato(fontSize: 14.0, color: Colors.black),
          ),
        ],
      )
    ],
  );
}

Column getSectionSplitter(String text) {
  return Column(
    children: [
      Divider(),
      Container(
          margin: EdgeInsets.only(top: 5, bottom: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ))
    ],
  );
}

Future<void> toast(String message) async {
  await Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 5, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
}

String shorten(String str, int len, {bool ellipsize = false}) {
  if (str.length <= len)
    return str;
  else if (ellipsize)
    return "${str.substring(0, len)}…";
  else
    return str.substring(0, len);
}

enum Types { DOWNLOADABLE, STREAMED, MEETUP, LIVE }

// region user management RPCs
Future<Tuple3<bool, int, String>> gprcAuthenticateUser(AuthenticateUser_AuthMethod method, String tokensJson) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  String sessionKey;
  int userId;
  try {
    final response = await stub.authenticateUser(AuthenticateUser_Request()
      ..method = method
      ..tokensJson = tokensJson);
    success = response.success;

    userId = response.userId;
    sessionKey = response.sessionKey;
    print(sessionKey);
    print(userId);
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple3(success, userId, sessionKey);
}

Future<Tuple2<bool, GlobensUser>> grpcFetchUserDetails(String sessionKey, int userId) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  GlobensUser user;

  try {
    final fetchUserDetailsRes = await stub.fetchUserDetails(FetchUserDetails_Request()
      ..sessionKey = sessionKey
      ..userId = userId);
    success = fetchUserDetailsRes.success;
    if (success) user = GlobensUser.create(fetchUserDetailsRes.id, fetchUserDetailsRes.email, fetchUserDetailsRes.name, fetchUserDetailsRes.picture, fetchUserDetailsRes.pictureBlob);
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return Tuple2(success, user);
}
// endregion

// region business page management RPCs
Future<Tuple2<bool, List<BusinessPage>>> grpcFetchMyBusinessPages(String sessionKey) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<BusinessPage> businessPages = List<BusinessPage>();

  try {
    final businessPageIdsRes = await stub.fetchMyBusinessPageIds(FetchMyBusinessPageIds_Request()..sessionKey = sessionKey);
    success = businessPageIdsRes.success;
    if (success) {
      for (int businessPageId in businessPageIdsRes.id) {
        final businessPageDetailsRes = await stub.fetchBusinessPageDetails(FetchBusinessPageDetails_Request()
          ..sessionKey = sessionKey
          ..businessPageId = businessPageId);
        success &= businessPageDetailsRes.success;
        if (success) businessPages.add(BusinessPage.create(businessPageDetailsRes.title, businessPageDetailsRes.pictureBlob, id: businessPageDetailsRes.id, type: businessPageDetailsRes.type, role: businessPageDetailsRes.role));
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, businessPages);
}

Future<bool> grpcCreateBusinessPage(String sessionKey, BusinessPage businessPage) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createBusinessPage(CreateBusinessPage_Request()
      ..sessionKey = sessionKey
      ..title = businessPage.title
      ..pictureBlob = businessPage.pictureBlob);
    success = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return success;
}
// endregion

// region products management RPCs
Future<bool> grpcCreateProduct(String sessionKey, BusinessPage businessPage, Product product) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createProduct(CreateProduct_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id
      ..name = product.name
      ..type = product.productType
      ..categoryId = product.category.id
      ..pictureBlob = product.pictureBlob
      ..price = product.price
      ..currency = product.currency
      ..description = product.description
      ..content = product.productContent);
    success = response.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<Tuple2<bool, List<Product>>> grpcFetchNextKProducts({int k = 100, FilterDetails filterDetails}) async {
  bool success = false;
  List<Product> products = List<Product>();
  Map<int, BusinessPage> businessPages = Map<int, BusinessPage>();
  Map<int, ProductCategory> categories = Map<int, ProductCategory>();

  if (filterDetails == null)
    filterDetails = FilterDetails()..useFilter = false;
  else
    filterDetails.useFilter = true;

  try {
    final productIds = await getStub().fetchNextKProductIds(FetchNextKProductIds_Request()
      ..k = k
      ..filterDetails = filterDetails
      ..previousProductId = 0);
    success = productIds.success;
    if (success) {
      for (int productId in productIds.id) {
        final productDetails = await getStub().fetchProductDetails(FetchProductDetails_Request()..productId = productId);
        success &= productDetails.success;

        if (!businessPages.containsKey(productDetails.businessPageId)) {
          final businessPageDetails = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()..businessPageId = productDetails.businessPageId);
          success &= productDetails.success;
          if (success) businessPages[productDetails.businessPageId] = BusinessPage.create(businessPageDetails.title, businessPageDetails.pictureBlob, id: businessPageDetails.id, type: businessPageDetails.type, role: businessPageDetails.role);
        }

        if (!categories.containsKey(productDetails.categoryId)) {
          final categoryDetails = await getStub().fetchProductCategoryDetails(FetchProductCategoryDetails_Request()..categoryId = productDetails.categoryId);
          success &= categoryDetails.success;
          if (success) categories[productDetails.categoryId] = ProductCategory.create(categoryDetails.id, categoryDetails.name, categoryDetails.examples, categoryDetails.pictureBlob);
        }

        if (success)
          products.add(Product.create(productDetails.name, productDetails.type, categories[productDetails.categoryId], productDetails.pictureBlob, businessPages[productDetails.businessPageId], productDetails.price, productDetails.currency, productDetails.description, productDetails.content, id: productDetails.id));
        else
          print('error on gb_product $productDetails');
      }
    }
  } catch (e) {
    print(e);
  }

  return Tuple2(success, products);
}

Future<Tuple2<bool, List<ProductCategory>>> grpcFetchProductCategories() async {
  bool success = false;
  List<ProductCategory> categories = List<ProductCategory>();

  try {
    final categoryIds = await getStub().fetchProductCategoryIds(FetchProductCategoryIds_Request());
    success = categoryIds.success;
    if (success) {
      for (int categoryId in categoryIds.id) {
        final categoryDetails = await getStub().fetchProductCategoryDetails(FetchProductCategoryDetails_Request()..categoryId = categoryId);
        success &= categoryDetails.success;
        if (success) categories.add(ProductCategory.create(categoryDetails.id, categoryDetails.name, categoryDetails.examples, categoryDetails.pictureBlob));
      }
    }
  } catch (e) {
    print(e);
  }

  categories.sort((a, b) {
    if (a.id == 1)
      return 1;
    else if (b.id == 1)
      return -1;
    else
      return a.id.compareTo(b.id);
  });

  return Tuple2(success, categories);
}
// endregion

// region job management RPCs
Future<Tuple2<bool, List<Job>>> grpcFetchBusinessPageJobs(String sessionKey, BusinessPage businessPage) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Job> jobs = List<Job>();
  Map<int, GlobensUser> users = Map<int, GlobensUser>();

  try {
    final businessPageJobIdsRes = await stub.fetchBusinessPageJobIds(FetchBusinessPageJobIds_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id);
    success = businessPageJobIdsRes.success;
    if (success)
      for (int jobId in businessPageJobIdsRes.id) {
        final jobDetailsRes = await stub.fetchJobDetails(FetchJobDetails_Request()
          ..sessionKey = sessionKey
          ..jobId = jobId);
        success &= jobDetailsRes.success;

        if (success) {
          if (users.containsKey(jobDetailsRes.hiredUserId))
            jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role, hiredUser: users[jobDetailsRes.hiredUserId])); // todo add description and responsibilities
          else {
            final hiredUserDetailsRes = await stub.fetchUserDetails(FetchUserDetails_Request()
              ..sessionKey = sessionKey
              ..userId = jobDetailsRes.hiredUserId);

            if (hiredUserDetailsRes.success) {
              users[jobDetailsRes.hiredUserId] = GlobensUser.create(hiredUserDetailsRes.id, hiredUserDetailsRes.email, hiredUserDetailsRes.name, hiredUserDetailsRes.picture, hiredUserDetailsRes.pictureBlob);
              jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role, hiredUser: users[jobDetailsRes.hiredUserId]));
            } else
              jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role));
          }
        }
      }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  jobs.sort((a, b) => a.isVacant & !b.isVacant ? 1 : 0);
  return Tuple2(success, jobs);
}

Future<bool> grpcCreateVacantJob(String sessionKey, BusinessPage businessPage, Job vacancy) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createVacantJob(CreateVacantJob_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id
      ..title = vacancy.title);
    success = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return success;
}

Future<Tuple2<bool, List<Job>>> grpcFetchBusinessPageVacancies(String sessionKey) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Job> jobs = List<Job>();

  try {
    final businessPageJobIdsRes = await stub.fetchNextKVacantJobIds(FetchNextKVacantJobIds_Request()
      ..sessionKey = sessionKey
      ..k = 100
      ..filterDetails = FilterDetails()
      ..previousVacantJobId = 0);
    success = businessPageJobIdsRes.success;
    if (success) {
      for (int jobId in businessPageJobIdsRes.id) {
        final jobDetailsRes = await stub.fetchJobDetails(FetchJobDetails_Request()
          ..sessionKey = sessionKey
          ..jobId = jobId);
        success &= jobDetailsRes.success;

        if (success) {
          jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role));
        }
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, jobs);
}
// endregion

// region job application management RPCs
Future<Tuple2<bool, List<JobApplication>>> grpcFetchJobApplications(String sessionKey, Job job) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<JobApplication> vacancyApplications = List<JobApplication>();

  try {
    final fetchJobApplicationIdsRes = await stub.fetchJobApplicationIds(FetchJobApplicationIds_Request()
      ..sessionKey = sessionKey
      ..jobId = job.id);
    success = fetchJobApplicationIdsRes.success;
    if (success) {
      for (int applicationId in fetchJobApplicationIdsRes.id) {
        final fetchJobApplicationDetailsRes = await stub.fetchJobApplicationDetails(FetchJobApplicationDetails_Request()
          ..sessionKey = sessionKey
          ..jobApplicationId = applicationId);
        success &= fetchJobApplicationDetailsRes.success;

        if (success) vacancyApplications.add(JobApplication.create(fetchJobApplicationDetailsRes.message, id: fetchJobApplicationDetailsRes.id, applicantId: fetchJobApplicationDetailsRes.applicantId));
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, vacancyApplications);
}

Future<bool> grpcCreateJobApplication(String sessionKey, Job job, JobApplication jobApplication) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;

  try {
    final response = await stub.createJobApplication(CreateJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobId = job.id
      ..message = jobApplication.message);
    success = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return success;
}

Future<bool> grpcApproveJobApplication(String sessionKey, JobApplication application) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;

  try {
    final result = await stub.approveJobApplication(ApproveJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobApplicationId = application.id);
    success = result.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return success;
}

Future<bool> grpcDeclineJobApplication(String sessionKey, JobApplication application) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;

  try {
    final result = await stub.declineJobApplication(DeclineJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobApplicationId = application.id);
    success = result.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return success;
}
// endregion
