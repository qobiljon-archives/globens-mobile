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
import 'dart:io' show Platform;

const int TIMEOUT = 6;

Container getTitleWidget(String text, {TextStyle textStyle, Color textColor = Colors.blue}) {
  return Container(
    margin: EdgeInsets.only(top: 10.0, left: 10.0),
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
          backgroundImage: AppUser.isAuthenticated() ? NetworkImage(AppUser.profileImageUrl) : AssetImage("assets/profile_placeholder.jpg"),
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

IconButton getBackNavButton(Function _onBackButtonPressed, BuildContext context) {
  if (Platform.isIOS)
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => _onBackButtonPressed(context),
    );
  else if (Platform.isAndroid)
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => _onBackButtonPressed(context),
    );
  return null;
}

Future<void> toast(String message) async {
  await Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
}

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
Future<Tuple2<bool, List<Product>>> grpcFetchBusinessPageProducts(String sessionKey, BusinessPage businessPage) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Product> products = List<Product>();

  try {
    final productIdsRes = await stub.fetchBusinessPageProductIds(FetchBusinessPageProductIds_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id);
    success = productIdsRes.success;
    if (success)
      for (int productId in productIdsRes.id) {
        final productDetailsRes = await stub.fetchProductDetails(FetchProductDetails_Request()
          ..sessionKey = sessionKey
          ..productId = productId);
        success &= productDetailsRes.success;
        if (success) products.add(Product.create(productDetailsRes.name, productDetailsRes.pictureBlob, businessPage, productDetailsRes.price, productDetailsRes.currency, id: productDetailsRes.id));
      }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, products);
}

Future<bool> grpcCreateProduct(String sessionKey, BusinessPage businessPage, Product product) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createProduct(CreateProduct_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id
      ..name = product.name
      ..pictureBlob = product.pictureBlob);
    success = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return success;
}

Future<Tuple2<bool, List<Product>>> grpcFetchNextKProducts(String sessionKey, {int k = 100}) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Product> products = List<Product>();
  Map<int, BusinessPage> businessPages = Map<int, BusinessPage>();

  try {
    final productIds = await stub.fetchNextKProductIds(FetchNextKProductIds_Request()
      ..sessionKey = sessionKey
      ..k = k
      ..filterDetails = FilterDetails()
      ..previousProductId = 0);
    success = productIds.success;
    if (success) {
      for (int productId in productIds.id) {
        final productDetails = await stub.fetchProductDetails(FetchProductDetails_Request()
          ..sessionKey = sessionKey
          ..productId = productId);
        success &= productDetails.success;

        if (success) {
          if (businessPages.containsKey(productDetails.id))
            products.add(Product.create(productDetails.name, productDetails.pictureBlob, businessPages[productDetails.businessPageId], productDetails.price, productDetails.currency, id: productDetails.id));
          else {
            final businessPageDetails = await stub.fetchBusinessPageDetails(FetchBusinessPageDetails_Request()..businessPageId = productDetails.businessPageId);
            success &= productDetails.success;

            if (success) products.add(Product.create(productDetails.name, productDetails.pictureBlob, BusinessPage.create(businessPageDetails.title, businessPageDetails.pictureBlob), productDetails.price, productDetails.currency, id: productDetails.id));
          }
        }
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }

  return Tuple2(success, products);
}

// endregion

// region job management RPCs
Future<Tuple2<bool, List<Job>>> grpcFetchBusinessPageJobs(String sessionKey, BusinessPage businessPage) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Job> jobs = List<Job>();

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

        if (success) jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role, hiredUserId: jobDetailsRes.hiredUserId));
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

        if (success) jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, role: jobDetailsRes.role, hiredUserId: jobDetailsRes.hiredUserId));
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
