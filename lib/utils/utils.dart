import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:grpc/grpc.dart';

Widget getTitleWidget(String text, {Color textColor = Colors.blue}) {
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}

Future<void> toast(String message) async {
  await Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
}

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
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple3(success, userId, sessionKey);
}

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

Future<Tuple2<bool, List<Product>>> grpcFetchBusinessPageProducts(String sessionKey, int businessPageId) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Product> products = List<Product>();

  try {
    final productIdsRes = await stub.fetchBusinessPageProductIds(FetchBusinessPageProductIds_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId);
    success = productIdsRes.success;
    if (success)
      for (int productId in productIdsRes.id) {
        final productDetailsRes = await stub.fetchProductDetails(FetchProductDetails_Request()
          ..sessionKey = sessionKey
          ..productId = productId);
        success &= productDetailsRes.success;
        if (success) products.add(Product.create(productDetailsRes.name, productDetailsRes.pictureBlob, id: productDetailsRes.id));
      }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, products);
}

Future<bool> grpcCreateProduct(String sessionKey, int businessPageId, Product product) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createProduct(CreateProduct_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId
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

Future<Tuple2<bool, List<Job>>> grpcFetchBusinessPageJobs(String sessionKey, int businessPageId) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  List<Job> jobs = List<Job>();

  try {
    final businessPageJobIdsRes = await stub.fetchBusinessPageJobIds(FetchBusinessPageJobIds_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId);
    success = businessPageJobIdsRes.success;
    if (success)
      for (int jobId in businessPageJobIdsRes.id) {
        final jobDetailsRes = await stub.fetchJobDetails(FetchJobDetails_Request()
          ..sessionKey = sessionKey
          ..jobId = jobId);
        success &= jobDetailsRes.success;

        if (success) jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, hiredUserId: jobDetailsRes.hiredUserId));
      }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  jobs.sort((a, b) => a.isVacant & !b.isVacant ? 1 : 0);
  return Tuple2(success, jobs);
}

Future<bool> grpcCreateVacantJob(String sessionKey, int businessPageId, Job vacancy) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;
  try {
    final response = await stub.createVacantJob(CreateVacantJob_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId
      ..title = vacancy.title);
    success = response.success;
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return success;
}

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

Future<bool> grpcCreateJobApplication(String sessionKey, int jobId, JobApplication jobApplication) async {
  final channel = ClientChannel(GRPC_HOST, port: GRPC_PORT, options: const ChannelOptions(credentials: ChannelCredentials.insecure()));
  final stub = GlobensServiceClient(channel);

  bool success = false;

  try {
    final response = await stub.createJobApplication(CreateJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobId = jobId
      ..message = jobApplication.message);
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

        if (success) jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, hiredUserId: jobDetailsRes.hiredUserId));
      }
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
  }
  return Tuple2(success, jobs);
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
  }
  return success;
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
