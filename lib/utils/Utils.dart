import 'package:globens_flutter_client/generated_protos/gb_service.pbgrpc.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/Content.dart';
import 'package:globens_flutter_client/entities/Review.dart';
import 'package:globens_flutter_client/utils/Settings.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart';
import 'package:tuple/tuple.dart';
import 'dart:convert';

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
          Text(AppUser.isAuthenticated() ? AppUser.displayName : Locale.get("Sign in"), style: TextStyle(fontSize: 20.0, color: Colors.black)),
          Text(
            AppUser.isAuthenticated() ? AppUser.email : Locale.get("Go to menu"),
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

String timestamp2String(int timestamp) {
  if (timestamp < 0)
    return "N/A";
  else {
    var datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var timeZone = "${datetime.timeZoneOffset.isNegative ? '' : '+'}${datetime.timeZoneOffset.inHours}";
    return "${datetime.month}/${datetime.day}, ${datetime.year}   ${datetime.hour}:${datetime.minute.toString().padLeft(2, '0')} ($timeZone)";
  }
}

String timestamp2HourString(int timestamp) {
  if (timestamp < 0)
    return "N/A";
  else {
    var datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var timeZone = "${datetime.timeZoneOffset.isNegative ? '' : '+'}${datetime.timeZoneOffset.inHours}";
    return "${datetime.month}/${datetime.day}, ${datetime.year} ($timeZone)";
  }
}

IconData getFileTypeIcon(String filename) {
  var contentType = getContentType(filename);
  if (contentType == ContentType.MEDIA)
    return Icons.play_circle_fill;
  else if (contentType == ContentType.DOCUMENT)
    return Icons.insert_drive_file_outlined;
  else
    return Icons.error;
}

ContentType getContentType(String filename) {
  // ['docx','doc','xlsx','xls','pptx','ppt','pdf','txt']
  if (filename.length > 4) {
    var extension = filename.substring(filename.length - 3).toLowerCase();
    if (['docx', 'doc', 'xlsx', 'xls', 'pptx', 'ppt', 'pdf', 'txt'].contains(extension))
      return ContentType.DOCUMENT;
    else if (['mp3', 'mp4', 'mov'].contains(extension)) return ContentType.MEDIA;
  }
  return ContentType.NONE;
}

String getSupportedFormatsStr() {
  return ['mp3', 'mp4', 'mov', 'txt', 'docx', 'doc', 'xlsx', 'xls', 'pptx', 'ppt', 'pdf', 'txt'].join(', ');
}

String getProductTypeStr(ProductType type) {
  if (type == ProductType.DOWNLOADABLE)
    return Locale.get('Downloadable files');
  else if (type == ProductType.STREAMED)
    return Locale.get('Streamed files');
  else if (type == ProductType.MEETUP)
    return Locale.get('Scheduled face-to-face meeting');
  else if (type == ProductType.LIVE)
    return Locale.get('Scheduled online call');
  else
    return null;
}

enum ContentType { DOCUMENT, MEDIA, NONE }
enum ProductType { DOWNLOADABLE, STREAMED, MEETUP, LIVE }
enum TimeSlotSize { THIRTY_MINUTES, SIXTY_MINUTES }

// region user management RPCs
Future<Tuple3<bool, int, String>> gprcAuthenticateUser(String tokensJson) async {
  bool success = false;
  String sessionKey;
  int userId;
  try {
    final response = await getStub().authenticateUser(AuthenticateUser_Request()..tokensJson = tokensJson);
    success = response.success;

    userId = response.userId;
    sessionKey = response.sessionKey;
    print(sessionKey);
    print(userId);
  } catch (e) {
    print(e);
  }
  return Tuple3(success, userId, sessionKey);
}

Future<bool> gprcUpdateUserDetails(String sessionKey, GlobensUser user) async {
  bool success = false;
  String sessionKey;
  try {
    final response = await getStub().updateUserDetails(UpdateUserDetails_Request()
      ..sessionKey = sessionKey
      ..countryCode = user.countryCode);
    success = response.success;
  } catch (e) {
    print(e);
    return false;
  }
  return success;
}

Future<Tuple2<bool, GlobensUser>> grpcFetchUserDetails(String sessionKey, int userId) async {
  bool success = false;
  GlobensUser user;

  try {
    final fetchUserDetailsRes = await getStub().fetchUserDetails(FetchUserDetails_Request()
      ..sessionKey = sessionKey
      ..userId = userId);
    success = fetchUserDetailsRes.success;
    if (success) user = GlobensUser.create(fetchUserDetailsRes.id, fetchUserDetailsRes.email, fetchUserDetailsRes.name, fetchUserDetailsRes.picture, fetchUserDetailsRes.pictureBlob, fetchUserDetailsRes.countryCode);
  } catch (e) {
    print(e);
  }

  return Tuple2(success, user);
}
// endregion

// region business page management RPCs
Future<Tuple2<bool, List<BusinessPage>>> grpcFetchMyBusinessPages(String sessionKey) async {
  bool success = false;
  var businessPages = <BusinessPage>[];

  try {
    final businessPageIdsRes = await getStub().fetchMyBusinessPageIds(FetchMyBusinessPageIds_Request()..sessionKey = sessionKey);
    success = businessPageIdsRes.success;
    if (success) {
      for (int businessPageId in businessPageIdsRes.id) {
        final businessPageDetailsRes = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()
          ..sessionKey = sessionKey
          ..businessPageId = businessPageId);
        success &= businessPageDetailsRes.success;
        if (success) businessPages.add(BusinessPage.create(businessPageDetailsRes.title, businessPageDetailsRes.pictureBlob, businessPageDetailsRes.countryCode, id: businessPageDetailsRes.id, type: businessPageDetailsRes.type, role: businessPageDetailsRes.role));
      }
    }
  } catch (e) {
    print(e);
  }
  return Tuple2(success, businessPages);
}

Future<bool> grpcCreateBusinessPage(String sessionKey, BusinessPage businessPage) async {
  bool success = false;
  try {
    final response = await getStub().createBusinessPage(CreateBusinessPage_Request()
      ..sessionKey = sessionKey
      ..title = businessPage.title
      ..pictureBlob = businessPage.pictureBlob
      ..countryCode = businessPage.countryCode);
    success = response.success;
  } catch (e) {
    print(e);
  }

  return success;
}
// endregion

// region products management RPCs
Future<Tuple2<bool, int>> grpcCreateProduct(String sessionKey, BusinessPage businessPage, Product product) async {
  try {
    final response = await getStub().createProduct(CreateProduct_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id
      ..name = product.name
      ..type = product.productType
      ..categoryId = product.category.id
      ..pictureBlob = product.pictureBlob
      ..price = product.price
      ..currency = product.currency
      ..description = product.description
      ..contents = product.contentsJson
      ..dynamicLink = product.dynamicLink);
    return Tuple2(response.success, response.productId);
  } catch (e) {
    print(e);
  }
  return Tuple2(false, -1);
}

Future<Tuple2<bool, int>> grpcCreateNewContent(String sessionKey, Content content) async {
  bool success = false;
  int contentId = -1;
  try {
    final response = await getStub().createNewContent(CreateNewContent_Request()
      ..sessionKey = sessionKey
      ..title = content.title
      ..fileId = content.fileId
      ..url = content.url);
    success = response.success;
    contentId = response.contentId;
  } catch (e) {
    print(e);
  }

  return Tuple2(success, contentId);
}

Future<bool> grpcRemoveContent(String sessionKey, Content content) async {
  try {
    final response = await getStub().deleteContent(DeleteContent_Request()
      ..sessionKey = sessionKey
      ..contentId = content.id);
    return response.success;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> grpcUpdateContent(String sessionKey, Content content) async {
  bool success = false;
  try {
    final response = await getStub().updateContent(UpdateContent_Request()
      ..sessionKey = sessionKey
      ..contentId = content.id
      ..title = content.title
      ..fileId = content.fileId
      ..url = content.url);
    success = response.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<Tuple2<bool, Content>> grpcFetchContentDetails(String sessionKey, int contentId) async {
  bool success = false;

  Content content;
  try {
    final contentDetails = await getStub().fetchContentDetails(FetchContentDetails_Request()
      ..sessionKey = sessionKey
      ..contentId = contentId);
    success = contentDetails.success;
    if (success) {
      content = Content.create(contentDetails.title, contentDetails.fileId, contentDetails.url, id: contentDetails.id);
    }
  } catch (e) {
    print(e);
  }

  return Tuple2(success, content);
}

Future<bool> deleteContent(String sessionKey, Content content) async {
  bool success = false;
  try {
    final response = await getStub().deleteContent(DeleteContent_Request()
      ..sessionKey = sessionKey
      ..contentId = content.id);
    success = response.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<bool> grpcUpdateProduct(String sessionKey, Product product) async {
  bool success = false;
  try {
    final response = await getStub().updateProductDetails(UpdateProductDetails_Request()
      ..sessionKey = sessionKey
      ..productId = product.id
      ..businessPageId = product.businessPage.id
      ..name = product.name
      ..type = product.productType
      ..categoryId = product.category.id
      ..pictureBlob = product.pictureBlob
      ..price = product.price
      ..currency = product.currency
      ..description = product.description
      ..contents = product.contentsJson
      ..dynamicLink = product.dynamicLink);
    success = response.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<Tuple2<bool, List<Product>>> grpcFetchNextKProducts({String sessionKey, int k = 100, FilterDetails filterDetails}) async {
  bool success = false;
  var products = <Product>[];
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
          var businessPageDetails;
          if (sessionKey == null)
            businessPageDetails = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()..businessPageId = productDetails.businessPageId);
          else
            businessPageDetails = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()
              ..sessionKey = sessionKey
              ..businessPageId = productDetails.businessPageId);
          success &= businessPageDetails.success;
          if (success) businessPages[productDetails.businessPageId] = BusinessPage.create(businessPageDetails.title, businessPageDetails.pictureBlob, businessPageDetails.countryCode, id: businessPageDetails.id, type: businessPageDetails.type, role: businessPageDetails.role);
        }

        if (!categories.containsKey(productDetails.categoryId)) {
          final categoryDetails = await getStub().fetchProductCategoryDetails(FetchProductCategoryDetails_Request()..categoryId = productDetails.categoryId);
          success &= categoryDetails.success;
          if (success) categories[productDetails.categoryId] = ProductCategory.create(categoryDetails.id, categoryDetails.nameJsonStr, categoryDetails.examplesJsonStr, categoryDetails.pictureBlob);
        }

        if (success)
          products.add(Product.create(productDetails.name, productDetails.type, categories[productDetails.categoryId], productDetails.pictureBlob, businessPages[productDetails.businessPageId], productDetails.price, productDetails.currency, productDetails.description, jsonDecode(productDetails.contents), productDetails.dynamicLink, id: productDetails.id, stars: productDetails.stars, reviewsCount: productDetails.reviewsCount, published: productDetails.published));
        else
          print('error on gb_product $productDetails');
      }
    }
  } catch (e) {
    print(e);
  }

  return Tuple2(success, products);
}

Future<Tuple2<bool, Product>> grpcFetchProduct(int productId) async {
  final productDetails = await getStub().fetchProductDetails(FetchProductDetails_Request()..productId = productId);
  if(productDetails.success) {
    var businessPageDetails = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()..businessPageId = productDetails.businessPageId);
    if(businessPageDetails.success) {
      var businessPage = BusinessPage.create(businessPageDetails.title, businessPageDetails.pictureBlob, businessPageDetails.countryCode, id: businessPageDetails.id, type: businessPageDetails.type, role: businessPageDetails.role);
      final categoryDetails = await getStub().fetchProductCategoryDetails(FetchProductCategoryDetails_Request()..categoryId = productDetails.categoryId);
      if (categoryDetails.success) {
        var productCategory = ProductCategory.create(categoryDetails.id, categoryDetails.nameJsonStr, categoryDetails.examplesJsonStr, categoryDetails.pictureBlob);
        var product = Product.create(productDetails.name, productDetails.type, productCategory, productDetails.pictureBlob, businessPage, productDetails.price, productDetails.currency, productDetails.description, jsonDecode(productDetails.contents), productDetails.dynamicLink, id: productDetails.id, stars: productDetails.stars, reviewsCount: productDetails.reviewsCount, published: productDetails.published);
        return Tuple2(true, product);
      }
    }
  }
  return Tuple2(false, null);
}

Future<Tuple2<bool, List<ProductCategory>>> grpcFetchProductCategories() async {
  bool success = false;
  var categories = <ProductCategory>[];

  try {
    final categoryIds = await getStub().fetchProductCategoryIds(FetchProductCategoryIds_Request());
    success = categoryIds.success;
    if (success) {
      for (int categoryId in categoryIds.id) {
        final categoryDetails = await getStub().fetchProductCategoryDetails(FetchProductCategoryDetails_Request()..categoryId = categoryId);
        success &= categoryDetails.success;
        if (success) categories.add(ProductCategory.create(categoryDetails.id, categoryDetails.nameJsonStr, categoryDetails.examplesJsonStr, categoryDetails.pictureBlob));
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
  bool success = false;
  var jobs = <Job>[];
  Map<int, GlobensUser> users = Map<int, GlobensUser>();

  try {
    final businessPageJobIdsRes = await getStub().fetchBusinessPageJobIds(FetchBusinessPageJobIds_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id);
    success = businessPageJobIdsRes.success;
    if (success)
      for (int jobId in businessPageJobIdsRes.id) {
        final jobDetailsRes = await getStub().fetchJobDetails(FetchJobDetails_Request()
          ..sessionKey = sessionKey
          ..jobId = jobId);
        success &= jobDetailsRes.success;

        if (success) {
          if (users.containsKey(jobDetailsRes.hiredUserId))
            jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, businessPage: businessPage, role: jobDetailsRes.role, hiredUser: users[jobDetailsRes.hiredUserId])); // todo add description and responsibilities
          else {
            final hiredUserDetailsRes = await getStub().fetchUserDetails(FetchUserDetails_Request()
              ..sessionKey = sessionKey
              ..userId = jobDetailsRes.hiredUserId);

            if (hiredUserDetailsRes.success) {
              users[jobDetailsRes.hiredUserId] = GlobensUser.create(hiredUserDetailsRes.id, hiredUserDetailsRes.email, hiredUserDetailsRes.name, hiredUserDetailsRes.picture, hiredUserDetailsRes.pictureBlob, hiredUserDetailsRes.countryCode);
              jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, businessPage: businessPage, role: jobDetailsRes.role, hiredUser: users[jobDetailsRes.hiredUserId]));
            } else
              jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, businessPage: businessPage, role: jobDetailsRes.role));
          }
        }
      }
  } catch (e) {
    print(e);
  }
  jobs.sort((a, b) => a.isVacant & !b.isVacant ? 1 : 0);
  return Tuple2(success, jobs);
}

Future<bool> grpcCreateVacantJob(String sessionKey, BusinessPage businessPage, Job vacancy) async {
  bool success = false;
  try {
    final response = await getStub().createVacantJob(CreateVacantJob_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPage.id
      ..title = vacancy.title);
    success = response.success;
  } catch (e) {
    print(e);
  }
  return success;
}

Future<Tuple2<bool, List<Job>>> grpcFetchVacantPositions(String sessionKey) async {
  bool success = false;
  var jobs = <Job>[];
  var businessPages = Map<int, BusinessPage>();

  try {
    final vacantJobIdsRes = await getStub().fetchNextKVacantJobIds(FetchNextKVacantJobIds_Request()
      ..sessionKey = sessionKey
      ..k = 100
      ..previousVacantJobId = 0);
    success = vacantJobIdsRes.success;
    if (success) {
      for (int jobId in vacantJobIdsRes.id) {
        final jobDetailsRes = await getStub().fetchJobDetails(FetchJobDetails_Request()
          ..sessionKey = sessionKey
          ..jobId = jobId);
        success &= jobDetailsRes.success;

        if (success) {
          if (businessPages.containsKey(jobDetailsRes.businessPageId))
            jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, businessPage: businessPages[jobDetailsRes.businessPageId], role: jobDetailsRes.role));
          else {
            final businessPageDetailsRes = await getStub().fetchBusinessPageDetails(FetchBusinessPageDetails_Request()
              ..sessionKey = sessionKey
              ..businessPageId = jobDetailsRes.businessPageId);
            success &= businessPageDetailsRes.success;

            if (success) {
              businessPages.putIfAbsent(jobDetailsRes.businessPageId, () => BusinessPage.create(businessPageDetailsRes.title, businessPageDetailsRes.pictureBlob, businessPageDetailsRes.countryCode, id: businessPageDetailsRes.id, type: businessPageDetailsRes.type, role: businessPageDetailsRes.role));
              jobs.add(Job.create(jobDetailsRes.title, id: jobDetailsRes.id, businessPage: businessPages[jobDetailsRes.businessPageId], role: jobDetailsRes.role));
            }
          }
        }
      }
    }
  } catch (e) {
    print(e);
  }
  return Tuple2(success, jobs);
}
// endregion

// region job application management RPCs
Future<Tuple2<bool, List<JobApplication>>> grpcFetchJobApplications(String sessionKey, Job job) async {
  bool success = false;
  var vacancyApplications = <JobApplication>[];
  var allApplicantUsers = Map<int, GlobensUser>();
  var allContents = Map<int, Content>();

  try {
    final fetchJobApplicationIdsRes = await getStub().fetchJobApplicationIds(FetchJobApplicationIds_Request()
      ..sessionKey = sessionKey
      ..jobId = job.id);

    success = fetchJobApplicationIdsRes.success;
    if (success) {
      for (int applicationId in fetchJobApplicationIdsRes.id) {
        var fetchJobApplicationDetailsRes = await getStub().fetchJobApplicationDetails(FetchJobApplicationDetails_Request()
          ..sessionKey = sessionKey
          ..jobApplicationId = applicationId);
        success &= fetchJobApplicationDetailsRes.success;

        if (success) {
          if (!allApplicantUsers.containsKey(fetchJobApplicationDetailsRes.applicantId)) {
            var fetchUserDetailsRes = await getStub().fetchUserDetails(FetchUserDetails_Request()
              ..sessionKey = sessionKey
              ..userId = fetchJobApplicationDetailsRes.applicantId);
            success &= fetchUserDetailsRes.success;
            if (success) allApplicantUsers.putIfAbsent(fetchUserDetailsRes.id, () => GlobensUser.create(fetchUserDetailsRes.id, fetchUserDetailsRes.email, fetchUserDetailsRes.name, fetchUserDetailsRes.picture, fetchUserDetailsRes.pictureBlob, fetchUserDetailsRes.countryCode));
          }

          if (success) {
            var contents = <Content>[];
            for (int contentId in jsonDecode(fetchJobApplicationDetailsRes.contents)['ids']) {
              if (!allContents.containsKey(contentId)) {
                var fetchContentDetailsRes = await getStub().fetchContentDetails(FetchContentDetails_Request()
                  ..sessionKey = sessionKey
                  ..contentId = contentId);
                success &= fetchContentDetailsRes.success;
                if (success) allContents.putIfAbsent(contentId, () => Content.create(fetchContentDetailsRes.title, fetchContentDetailsRes.fileId, fetchContentDetailsRes.url));
              }

              if (allContents.containsKey(contentId)) contents.add(allContents[contentId]);
            }

            if (success) vacancyApplications.add(JobApplication.create(fetchJobApplicationDetailsRes.message, contents, job, id: fetchJobApplicationDetailsRes.id, applicant: allApplicantUsers[fetchJobApplicationDetailsRes.applicantId]));
          }
        }
      }
    }
  } catch (e) {
    print(e);
  }
  return Tuple2(success, vacancyApplications);
}

Future<bool> grpcCreateJobApplication(String sessionKey, Job job, JobApplication jobApplication) async {
  bool success = false;

  try {
    final response = await getStub().createJobApplication(CreateJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobId = job.id
      ..contents = jobApplication.contentsJson
      ..message = jobApplication.message);
    success = response.success;
  } catch (e) {
    print(e);
  }
  return success;
}

Future<bool> grpcApproveJobApplication(String sessionKey, JobApplication application) async {
  bool success = false;

  try {
    final result = await getStub().approveJobApplication(ApproveJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobApplicationId = application.id);
    success = result.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<bool> grpcDeclineJobApplication(String sessionKey, JobApplication application) async {
  bool success = false;

  try {
    final result = await getStub().declineJobApplication(DeclineJobApplication_Request()
      ..sessionKey = sessionKey
      ..jobApplicationId = application.id);
    success = result.success;
  } catch (e) {
    print(e);
  }

  return success;
}

Future<bool> grpcSubmitProductReview(String sessionKey, Product product, int stars, String review) async {
  bool isSuccess = false;
  try {
    final response = await getStub().submitProductReview(SubmitProductReview_Request()
      ..sessionKey = sessionKey
      ..productId = product.id
      ..stars = stars
      ..text = review
      ..timestamp = Int64(DateTime.now().millisecondsSinceEpoch));
    isSuccess = response.success;
  } catch (e) {
    print(e);
  }
  return isSuccess;
}

Future<bool> grpcSubmitEmployeeReview(String sessionKey, int businessPageId, int employeeId, String review) async {
  bool isSuccess = false;
  try {
    final response = await getStub().submitEmployeeReview(SubmitEmployeeReview_Request()
      ..sessionKey = sessionKey
      ..businessPageId = businessPageId
      ..employeeUserId = employeeId
      ..text = review
      ..timestamp = Int64(DateTime.now().millisecondsSinceEpoch));
    isSuccess = response.success;
  } catch (e) {
    print(e);
  }
  return isSuccess;
}

Future<Tuple2<bool, List<Review>>> grpcFetchProductReviews(String sessionKey, int productId) async {
  bool isSuccess = false;
  var reviews = <Review>[];
  try {
    final response = await getStub().retrieveProductReviews(RetrieveProductReviews_Request()
      ..sessionKey = sessionKey
      ..productId = productId);
    isSuccess = response.success;
    for (var i = 0; i < response.id.length; i++) {
      reviews.add(Review.create(response.text[i], id: response.id[i], stars: response.stars[i], isMyReview: response.isMyReview[i]));
    }
  } catch (e) {
    print(e);
  }
  return Tuple2(isSuccess, reviews);
}

Future<bool> grpcPublishProduct(String sessionKey, int productId) async {
  bool isSuccess = false;
  try {
    final response = await getStub().publishProduct(PublishProduct_Request()
      ..sessionKey = sessionKey
      ..productId = productId);
    isSuccess = response.success;
  } catch (e) {
    print(e);
  }
  return isSuccess;
}

Future<bool> grpcUnpublishProduct(String sessionKey, int productId) async {
  bool isSuccess = false;
  try {
    final response = await getStub().unpublishProduct(UnpublishProduct_Request()
      ..sessionKey = sessionKey
      ..productId = productId);
    isSuccess = response.success;
  } catch (e) {
    print(e);
  }
  return isSuccess;
}

// endregion

class PrimitiveWrapper {
  var value;

  PrimitiveWrapper(this.value);
}

class TimeSlot {
  TimeSlot();

  int startTimestamp;
  TimeSlotSize size;

  bool get isNa {
    return startTimestamp == null || size == null;
  }
}
