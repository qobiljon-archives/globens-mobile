///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AuthenticateUser$json = const {
  '1': 'AuthenticateUser',
  '3': const [AuthenticateUser_Request$json, AuthenticateUser_Response$json],
  '4': const [AuthenticateUser_AuthMethod$json],
};

const AuthenticateUser_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'method', '3': 1, '4': 1, '5': 14, '6': '.AuthenticateUser.AuthMethod', '10': 'method'},
    const {'1': 'accessToken', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

const AuthenticateUser_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'sessionKey', '3': 2, '4': 1, '5': 5, '10': 'sessionKey'},
  ],
};

const AuthenticateUser_AuthMethod$json = const {
  '1': 'AuthMethod',
  '2': const [
    const {'1': 'GOOGLE', '2': 0},
    const {'1': 'FACEBOOK', '2': 1},
    const {'1': 'KAKAOTALK', '2': 3},
    const {'1': 'PHONE', '2': 4},
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
  ],
};

const FetchUserDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const CreateVacancy$json = const {
  '1': 'CreateVacancy',
  '3': const [CreateVacancy_Request$json, CreateVacancy_Response$json],
};

const CreateVacancy_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const CreateVacancy_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateVacancyDetails$json = const {
  '1': 'UpdateVacancyDetails',
  '3': const [UpdateVacancyDetails_Request$json, UpdateVacancyDetails_Response$json],
};

const UpdateVacancyDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateVacancyDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateVacancy$json = const {
  '1': 'UncreateVacancy',
  '3': const [UncreateVacancy_Request$json, UncreateVacancy_Response$json],
};

const UncreateVacancy_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateVacancy_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchVacancies$json = const {
  '1': 'FetchVacancies',
  '3': const [FetchVacancies_Request$json, FetchVacancies_Response$json],
};

const FetchVacancies_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchVacancies_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchVacancyDetails$json = const {
  '1': 'FetchVacancyDetails',
  '3': const [FetchVacancyDetails_Request$json, FetchVacancyDetails_Response$json],
};

const FetchVacancyDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchVacancyDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const CreateVacancyApplication$json = const {
  '1': 'CreateVacancyApplication',
  '3': const [CreateVacancyApplication_Request$json, CreateVacancyApplication_Response$json],
};

const CreateVacancyApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const CreateVacancyApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UpdateVacancyApplicationDetails$json = const {
  '1': 'UpdateVacancyApplicationDetails',
  '3': const [UpdateVacancyApplicationDetails_Request$json, UpdateVacancyApplicationDetails_Response$json],
};

const UpdateVacancyApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UpdateVacancyApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const UncreateVacancyApplication$json = const {
  '1': 'UncreateVacancyApplication',
  '3': const [UncreateVacancyApplication_Request$json, UncreateVacancyApplication_Response$json],
};

const UncreateVacancyApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const UncreateVacancyApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchMyVacancyApplications$json = const {
  '1': 'FetchMyVacancyApplications',
  '3': const [FetchMyVacancyApplications_Request$json, FetchMyVacancyApplications_Response$json],
};

const FetchMyVacancyApplications_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchMyVacancyApplications_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const FetchVacancyApplicationDetails$json = const {
  '1': 'FetchVacancyApplicationDetails',
  '3': const [FetchVacancyApplicationDetails_Request$json, FetchVacancyApplicationDetails_Response$json],
};

const FetchVacancyApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchVacancyApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
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

const FetchBusinessPages$json = const {
  '1': 'FetchBusinessPages',
  '3': const [FetchBusinessPages_Request$json, FetchBusinessPages_Response$json],
};

const FetchBusinessPages_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchBusinessPages_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
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
  ],
};

const FetchBusinessPageDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
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

const FetchProducts$json = const {
  '1': 'FetchProducts',
  '3': const [FetchProducts_Request$json, FetchProducts_Response$json],
};

const FetchProducts_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

const FetchProducts_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
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
  ],
};

const FetchProductDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
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

const TestSum$json = const {
  '1': 'TestSum',
  '3': const [TestSum_Request$json, TestSum_Response$json],
};

const TestSum_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'a', '3': 1, '4': 1, '5': 5, '10': 'a'},
    const {'1': 'b', '3': 2, '4': 1, '5': 5, '10': 'b'},
  ],
};

const TestSum_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'c', '3': 1, '4': 1, '5': 5, '10': 'c'},
  ],
};

