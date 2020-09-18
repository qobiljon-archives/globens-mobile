///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const FilterDetails$json = const {
  '1': 'FilterDetails',
  '2': const [
    const {'1': 'useFilter', '3': 1, '4': 1, '5': 8, '10': 'useFilter'},
    const {'1': 'filterText', '3': 2, '4': 1, '5': 9, '10': 'filterText'},
  ],
};

const AuthenticateUser$json = const {
  '1': 'AuthenticateUser',
  '3': const [AuthenticateUser_Request$json, AuthenticateUser_Response$json],
  '4': const [AuthenticateUser_AuthMethod$json],
};

const AuthenticateUser_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'method', '3': 1, '4': 1, '5': 14, '6': '.AuthenticateUser.AuthMethod', '10': 'method'},
    const {'1': 'tokensJson', '3': 2, '4': 1, '5': 9, '10': 'tokensJson'},
  ],
};

const AuthenticateUser_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'sessionKey', '3': 3, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const AuthenticateUser_AuthMethod$json = const {
  '1': 'AuthMethod',
  '2': const [
    const {'1': 'GOOGLE', '2': 0},
    const {'1': 'FACEBOOK', '2': 1},
    const {'1': 'KAKAOTALK', '2': 3},
    const {'1': 'PHONE', '2': 4},
    const {'1': 'APPLE', '2': 5},
  ],
};

const DeactivateUser$json = const {
  '1': 'DeactivateUser',
  '3': const [DeactivateUser_Request$json, DeactivateUser_Response$json],
};

const DeactivateUser_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 5, '10': 'sessionKey'},
  ],
};

const DeactivateUser_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateUserDetails$json = const {
  '1': 'UpdateUserDetails',
  '3': const [UpdateUserDetails_Request$json, UpdateUserDetails_Response$json],
};

const UpdateUserDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateUserDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchUserDetails$json = const {
  '1': 'FetchUserDetails',
  '3': const [FetchUserDetails_Request$json, FetchUserDetails_Response$json],
};

const FetchUserDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

const FetchUserDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'picture', '3': 5, '4': 1, '5': 9, '10': 'picture'},
    const {'1': 'pictureBlob', '3': 6, '4': 1, '5': 12, '10': 'pictureBlob'},
  ],
};

const CreateBusinessPage$json = const {
  '1': 'CreateBusinessPage',
  '3': const [CreateBusinessPage_Request$json, CreateBusinessPage_Response$json],
};

const CreateBusinessPage_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'pictureBlob', '3': 3, '4': 1, '5': 12, '10': 'pictureBlob'},
  ],
};

const CreateBusinessPage_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateBusinessPageDetails$json = const {
  '1': 'UpdateBusinessPageDetails',
  '3': const [UpdateBusinessPageDetails_Request$json, UpdateBusinessPageDetails_Response$json],
};

const UpdateBusinessPageDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateBusinessPageDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateBusinessPage$json = const {
  '1': 'UncreateBusinessPage',
  '3': const [UncreateBusinessPage_Request$json, UncreateBusinessPage_Response$json],
};

const UncreateBusinessPage_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateBusinessPage_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchMyBusinessPageIds$json = const {
  '1': 'FetchMyBusinessPageIds',
  '3': const [FetchMyBusinessPageIds_Request$json, FetchMyBusinessPageIds_Response$json],
};

const FetchMyBusinessPageIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchMyBusinessPageIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchBusinessPageDetails$json = const {
  '1': 'FetchBusinessPageDetails',
  '3': const [FetchBusinessPageDetails_Request$json, FetchBusinessPageDetails_Response$json],
};

const FetchBusinessPageDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

const FetchBusinessPageDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'pictureBlob', '3': 5, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'role', '3': 6, '4': 1, '5': 9, '10': 'role'},
  ],
};

const CreateProduct$json = const {
  '1': 'CreateProduct',
  '3': const [CreateProduct_Request$json, CreateProduct_Response$json],
};

const CreateProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'pictureBlob', '3': 4, '4': 1, '5': 12, '10': 'pictureBlob'},
  ],
};

const CreateProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateProductDetails$json = const {
  '1': 'UpdateProductDetails',
  '3': const [UpdateProductDetails_Request$json, UpdateProductDetails_Response$json],
};

const UpdateProductDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateProductDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateProduct$json = const {
  '1': 'UncreateProduct',
  '3': const [UncreateProduct_Request$json, UncreateProduct_Response$json],
};

const UncreateProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchBusinessPageProductIds$json = const {
  '1': 'FetchBusinessPageProductIds',
  '3': const [FetchBusinessPageProductIds_Request$json, FetchBusinessPageProductIds_Response$json],
};

const FetchBusinessPageProductIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

const FetchBusinessPageProductIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchNextKProductIds$json = const {
  '1': 'FetchNextKProductIds',
  '3': const [FetchNextKProductIds_Request$json, FetchNextKProductIds_Response$json],
};

const FetchNextKProductIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'k', '3': 2, '4': 1, '5': 5, '10': 'k'},
    const {'1': 'previousProductId', '3': 3, '4': 1, '5': 5, '10': 'previousProductId'},
    const {'1': 'filterDetails', '3': 4, '4': 1, '5': 11, '6': '.FilterDetails', '10': 'filterDetails'},
  ],
};

const FetchNextKProductIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchProductDetails$json = const {
  '1': 'FetchProductDetails',
  '3': const [FetchProductDetails_Request$json, FetchProductDetails_Response$json],
};

const FetchProductDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
  ],
};

const FetchProductDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'published', '3': 4, '4': 1, '5': 8, '10': 'published'},
    const {'1': 'pictureBlob', '3': 5, '4': 1, '5': 12, '10': 'pictureBlob'},
  ],
};

const PublishProduct$json = const {
  '1': 'PublishProduct',
  '3': const [PublishProduct_Request$json, PublishProduct_Response$json],
};

const PublishProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const PublishProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UnpublishProduct$json = const {
  '1': 'UnpublishProduct',
  '3': const [UnpublishProduct_Request$json, UnpublishProduct_Response$json],
};

const UnpublishProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UnpublishProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const CreateVacantJob$json = const {
  '1': 'CreateVacantJob',
  '3': const [CreateVacantJob_Request$json, CreateVacantJob_Response$json],
};

const CreateVacantJob_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

const CreateVacantJob_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateJobDetails$json = const {
  '1': 'UpdateJobDetails',
  '3': const [UpdateJobDetails_Request$json, UpdateJobDetails_Response$json],
};

const UpdateJobDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateJobDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateJob$json = const {
  '1': 'UncreateJob',
  '3': const [UncreateJob_Request$json, UncreateJob_Response$json],
};

const UncreateJob_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateJob_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchBusinessPageJobIds$json = const {
  '1': 'FetchBusinessPageJobIds',
  '3': const [FetchBusinessPageJobIds_Request$json, FetchBusinessPageJobIds_Response$json],
};

const FetchBusinessPageJobIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

const FetchBusinessPageJobIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchNextKVacantJobIds$json = const {
  '1': 'FetchNextKVacantJobIds',
  '3': const [FetchNextKVacantJobIds_Request$json, FetchNextKVacantJobIds_Response$json],
};

const FetchNextKVacantJobIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'k', '3': 2, '4': 1, '5': 5, '10': 'k'},
    const {'1': 'previousVacantJobId', '3': 3, '4': 1, '5': 5, '10': 'previousVacantJobId'},
    const {'1': 'filterDetails', '3': 4, '4': 1, '5': 11, '6': '.FilterDetails', '10': 'filterDetails'},
  ],
};

const FetchNextKVacantJobIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchJobDetails$json = const {
  '1': 'FetchJobDetails',
  '3': const [FetchJobDetails_Request$json, FetchJobDetails_Response$json],
};

const FetchJobDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
  ],
};

const FetchJobDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'role', '3': 3, '4': 1, '5': 9, '10': 'role'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'hiredUserId', '3': 5, '4': 1, '5': 5, '10': 'hiredUserId'},
  ],
};

const CreateJobApplication$json = const {
  '1': 'CreateJobApplication',
  '3': const [CreateJobApplication_Request$json, CreateJobApplication_Response$json],
};

const CreateJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

const CreateJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateJobApplicationDetails$json = const {
  '1': 'UpdateJobApplicationDetails',
  '3': const [UpdateJobApplicationDetails_Request$json, UpdateJobApplicationDetails_Response$json],
};

const UpdateJobApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateJobApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateJobApplication$json = const {
  '1': 'UncreateJobApplication',
  '3': const [UncreateJobApplication_Request$json, UncreateJobApplication_Response$json],
};

const UncreateJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchJobApplicationIds$json = const {
  '1': 'FetchJobApplicationIds',
  '3': const [FetchJobApplicationIds_Request$json, FetchJobApplicationIds_Response$json],
};

const FetchJobApplicationIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
  ],
};

const FetchJobApplicationIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

const FetchJobApplicationDetails$json = const {
  '1': 'FetchJobApplicationDetails',
  '3': const [FetchJobApplicationDetails_Request$json, FetchJobApplicationDetails_Response$json],
};

const FetchJobApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

const FetchJobApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'applicantId', '3': 4, '4': 1, '5': 5, '10': 'applicantId'},
  ],
};

const ApproveJobApplication$json = const {
  '1': 'ApproveJobApplication',
  '3': const [ApproveJobApplication_Request$json, ApproveJobApplication_Response$json],
};

const ApproveJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

const ApproveJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const DeclineJobApplication$json = const {
  '1': 'DeclineJobApplication',
  '3': const [DeclineJobApplication_Request$json, DeclineJobApplication_Response$json],
};

const DeclineJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

const DeclineJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const LogPurchase$json = const {
  '1': 'LogPurchase',
  '3': const [LogPurchase_Request$json, LogPurchase_Response$json],
};

const LogPurchase_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const LogPurchase_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchPurchases$json = const {
  '1': 'FetchPurchases',
  '3': const [FetchPurchases_Request$json, FetchPurchases_Response$json],
};

const FetchPurchases_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchPurchases_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchPurchaseDetails$json = const {
  '1': 'FetchPurchaseDetails',
  '3': const [FetchPurchaseDetails_Request$json, FetchPurchaseDetails_Response$json],
};

const FetchPurchaseDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchPurchaseDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

