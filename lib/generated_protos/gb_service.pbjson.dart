///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authMethodDescriptor instead')
const AuthMethod$json = const {
  '1': 'AuthMethod',
  '2': const [
    const {'1': 'APPLE', '2': 0},
    const {'1': 'GOOGLE', '2': 1},
  ],
};

/// Descriptor for `AuthMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authMethodDescriptor = $convert.base64Decode('CgpBdXRoTWV0aG9kEgkKBUFQUExFEAASCgoGR09PR0xFEAE=');
@$core.Deprecated('Use currencyDescriptor instead')
const Currency$json = const {
  '1': 'Currency',
  '2': const [
    const {'1': 'KRW', '2': 0},
    const {'1': 'USD', '2': 1},
    const {'1': 'UZS', '2': 3},
    const {'1': 'RUB', '2': 4},
  ],
};

/// Descriptor for `Currency`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List currencyDescriptor = $convert.base64Decode('CghDdXJyZW5jeRIHCgNLUlcQABIHCgNVU0QQARIHCgNVWlMQAxIHCgNSVUIQBA==');
@$core.Deprecated('Use productDeliveryTypeDescriptor instead')
const ProductDeliveryType$json = const {
  '1': 'ProductDeliveryType',
  '2': const [
    const {'1': 'FILE_DOWNLOADABLE', '2': 0},
    const {'1': 'FILE_STREAMED', '2': 1},
    const {'1': 'SCHEDULED_FACE_TO_FACE', '2': 3},
    const {'1': 'SCHEDULED_ONLINE_CALL', '2': 4},
  ],
};

/// Descriptor for `ProductDeliveryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List productDeliveryTypeDescriptor = $convert.base64Decode('ChNQcm9kdWN0RGVsaXZlcnlUeXBlEhUKEUZJTEVfRE9XTkxPQURBQkxFEAASEQoNRklMRV9TVFJFQU1FRBABEhoKFlNDSEVEVUxFRF9GQUNFX1RPX0ZBQ0UQAxIZChVTQ0hFRFVMRURfT05MSU5FX0NBTEwQBA==');
@$core.Deprecated('Use filterDetailsDescriptor instead')
const FilterDetails$json = const {
  '1': 'FilterDetails',
  '2': const [
    const {'1': 'useFilter', '3': 1, '4': 1, '5': 8, '10': 'useFilter'},
    const {'1': 'publishedProductsOnly', '3': 2, '4': 1, '5': 8, '10': 'publishedProductsOnly'},
    const {'1': 'substring', '3': 3, '4': 1, '5': 9, '10': 'substring'},
    const {'1': 'regex', '3': 4, '4': 1, '5': 9, '10': 'regex'},
    const {'1': 'categoryId', '3': 5, '4': 1, '5': 5, '10': 'categoryId'},
    const {'1': 'businessPageId', '3': 6, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

/// Descriptor for `FilterDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterDetailsDescriptor = $convert.base64Decode('Cg1GaWx0ZXJEZXRhaWxzEhwKCXVzZUZpbHRlchgBIAEoCFIJdXNlRmlsdGVyEjQKFXB1Ymxpc2hlZFByb2R1Y3RzT25seRgCIAEoCFIVcHVibGlzaGVkUHJvZHVjdHNPbmx5EhwKCXN1YnN0cmluZxgDIAEoCVIJc3Vic3RyaW5nEhQKBXJlZ2V4GAQgASgJUgVyZWdleBIeCgpjYXRlZ29yeUlkGAUgASgFUgpjYXRlZ29yeUlkEiYKDmJ1c2luZXNzUGFnZUlkGAYgASgFUg5idXNpbmVzc1BhZ2VJZA==');
@$core.Deprecated('Use authenticateUserDescriptor instead')
const AuthenticateUser$json = const {
  '1': 'AuthenticateUser',
  '3': const [AuthenticateUser_Request$json, AuthenticateUser_Response$json],
};

@$core.Deprecated('Use authenticateUserDescriptor instead')
const AuthenticateUser_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'method', '3': 1, '4': 1, '5': 14, '6': '.AuthMethod', '10': 'method'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

@$core.Deprecated('Use authenticateUserDescriptor instead')
const AuthenticateUser_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'sessionKey', '3': 3, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

/// Descriptor for `AuthenticateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateUserDescriptor = $convert.base64Decode('ChBBdXRoZW50aWNhdGVVc2VyGkQKB1JlcXVlc3QSIwoGbWV0aG9kGAEgASgOMgsuQXV0aE1ldGhvZFIGbWV0aG9kEhQKBXRva2VuGAIgASgJUgV0b2tlbhpcCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhYKBnVzZXJJZBgCIAEoBVIGdXNlcklkEh4KCnNlc3Npb25LZXkYAyABKAlSCnNlc3Npb25LZXk=');
@$core.Deprecated('Use deactivateUserDescriptor instead')
const DeactivateUser$json = const {
  '1': 'DeactivateUser',
  '3': const [DeactivateUser_Request$json, DeactivateUser_Response$json],
};

@$core.Deprecated('Use deactivateUserDescriptor instead')
const DeactivateUser_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 5, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use deactivateUserDescriptor instead')
const DeactivateUser_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeactivateUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deactivateUserDescriptor = $convert.base64Decode('Cg5EZWFjdGl2YXRlVXNlchopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAVSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use updateUserDetailsDescriptor instead')
const UpdateUserDetails$json = const {
  '1': 'UpdateUserDetails',
  '3': const [UpdateUserDetails_Request$json, UpdateUserDetails_Response$json],
};

@$core.Deprecated('Use updateUserDetailsDescriptor instead')
const UpdateUserDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'countryCode', '3': 2, '4': 1, '5': 9, '10': 'countryCode'},
    const {'1': 'googleDriveEmail', '3': 3, '4': 1, '5': 9, '10': 'googleDriveEmail'},
  ],
};

@$core.Deprecated('Use updateUserDetailsDescriptor instead')
const UpdateUserDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateUserDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserDetailsDescriptor = $convert.base64Decode('ChFVcGRhdGVVc2VyRGV0YWlscxp3CgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSIAoLY291bnRyeUNvZGUYAiABKAlSC2NvdW50cnlDb2RlEioKEGdvb2dsZURyaXZlRW1haWwYAyABKAlSEGdvb2dsZURyaXZlRW1haWwaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use fetchUserDetailsDescriptor instead')
const FetchUserDetails$json = const {
  '1': 'FetchUserDetails',
  '3': const [FetchUserDetails_Request$json, FetchUserDetails_Response$json],
};

@$core.Deprecated('Use fetchUserDetailsDescriptor instead')
const FetchUserDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

@$core.Deprecated('Use fetchUserDetailsDescriptor instead')
const FetchUserDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'picture', '3': 5, '4': 1, '5': 9, '10': 'picture'},
    const {'1': 'pictureBlob', '3': 6, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'countryCode', '3': 7, '4': 1, '5': 9, '10': 'countryCode'},
  ],
};

/// Descriptor for `FetchUserDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchUserDetailsDescriptor = $convert.base64Decode('ChBGZXRjaFVzZXJEZXRhaWxzGkEKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIWCgZ1c2VySWQYAiABKAVSBnVzZXJJZBq8AQoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAEoBVICaWQSFAoFZW1haWwYAyABKAlSBWVtYWlsEhIKBG5hbWUYBCABKAlSBG5hbWUSGAoHcGljdHVyZRgFIAEoCVIHcGljdHVyZRIgCgtwaWN0dXJlQmxvYhgGIAEoDFILcGljdHVyZUJsb2ISIAoLY291bnRyeUNvZGUYByABKAlSC2NvdW50cnlDb2Rl');
@$core.Deprecated('Use createBusinessPageDescriptor instead')
const CreateBusinessPage$json = const {
  '1': 'CreateBusinessPage',
  '3': const [CreateBusinessPage_Request$json, CreateBusinessPage_Response$json],
};

@$core.Deprecated('Use createBusinessPageDescriptor instead')
const CreateBusinessPage_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'pictureBlob', '3': 3, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'countryCode', '3': 4, '4': 1, '5': 9, '10': 'countryCode'},
  ],
};

@$core.Deprecated('Use createBusinessPageDescriptor instead')
const CreateBusinessPage_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateBusinessPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessPageDescriptor = $convert.base64Decode('ChJDcmVhdGVCdXNpbmVzc1BhZ2UagwEKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIAoLcGljdHVyZUJsb2IYAyABKAxSC3BpY3R1cmVCbG9iEiAKC2NvdW50cnlDb2RlGAQgASgJUgtjb3VudHJ5Q29kZRokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use updateBusinessPageDetailsDescriptor instead')
const UpdateBusinessPageDetails$json = const {
  '1': 'UpdateBusinessPageDetails',
  '3': const [UpdateBusinessPageDetails_Request$json, UpdateBusinessPageDetails_Response$json],
};

@$core.Deprecated('Use updateBusinessPageDetailsDescriptor instead')
const UpdateBusinessPageDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'pictureBlob', '3': 4, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'countryCode', '3': 5, '4': 1, '5': 9, '10': 'countryCode'},
  ],
};

@$core.Deprecated('Use updateBusinessPageDetailsDescriptor instead')
const UpdateBusinessPageDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateBusinessPageDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessPageDetailsDescriptor = $convert.base64Decode('ChlVcGRhdGVCdXNpbmVzc1BhZ2VEZXRhaWxzGqsBCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSJgoOYnVzaW5lc3NQYWdlSWQYAiABKAVSDmJ1c2luZXNzUGFnZUlkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRIgCgtwaWN0dXJlQmxvYhgEIAEoDFILcGljdHVyZUJsb2ISIAoLY291bnRyeUNvZGUYBSABKAlSC2NvdW50cnlDb2RlGiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use uncreateBusinessPageDescriptor instead')
const UncreateBusinessPage$json = const {
  '1': 'UncreateBusinessPage',
  '3': const [UncreateBusinessPage_Request$json, UncreateBusinessPage_Response$json],
};

@$core.Deprecated('Use uncreateBusinessPageDescriptor instead')
const UncreateBusinessPage_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use uncreateBusinessPageDescriptor instead')
const UncreateBusinessPage_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UncreateBusinessPage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uncreateBusinessPageDescriptor = $convert.base64Decode('ChRVbmNyZWF0ZUJ1c2luZXNzUGFnZRopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use fetchMyBusinessPageIdsDescriptor instead')
const FetchMyBusinessPageIds$json = const {
  '1': 'FetchMyBusinessPageIds',
  '3': const [FetchMyBusinessPageIds_Request$json, FetchMyBusinessPageIds_Response$json],
};

@$core.Deprecated('Use fetchMyBusinessPageIdsDescriptor instead')
const FetchMyBusinessPageIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use fetchMyBusinessPageIdsDescriptor instead')
const FetchMyBusinessPageIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchMyBusinessPageIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchMyBusinessPageIdsDescriptor = $convert.base64Decode('ChZGZXRjaE15QnVzaW5lc3NQYWdlSWRzGikKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRo0CghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEg4KAmlkGAIgAygFUgJpZA==');
@$core.Deprecated('Use fetchBusinessPageDetailsDescriptor instead')
const FetchBusinessPageDetails$json = const {
  '1': 'FetchBusinessPageDetails',
  '3': const [FetchBusinessPageDetails_Request$json, FetchBusinessPageDetails_Response$json],
};

@$core.Deprecated('Use fetchBusinessPageDetailsDescriptor instead')
const FetchBusinessPageDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

@$core.Deprecated('Use fetchBusinessPageDetailsDescriptor instead')
const FetchBusinessPageDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'pictureBlob', '3': 5, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'countryCode', '3': 6, '4': 1, '5': 9, '10': 'countryCode'},
    const {'1': 'role', '3': 7, '4': 1, '5': 9, '10': 'role'},
  ],
};

/// Descriptor for `FetchBusinessPageDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBusinessPageDetailsDescriptor = $convert.base64Decode('ChhGZXRjaEJ1c2luZXNzUGFnZURldGFpbHMaUQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EiYKDmJ1c2luZXNzUGFnZUlkGAIgASgFUg5idXNpbmVzc1BhZ2VJZBq2AQoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAEoBVICaWQSFAoFdGl0bGUYAyABKAlSBXRpdGxlEhIKBHR5cGUYBCABKAlSBHR5cGUSIAoLcGljdHVyZUJsb2IYBSABKAxSC3BpY3R1cmVCbG9iEiAKC2NvdW50cnlDb2RlGAYgASgJUgtjb3VudHJ5Q29kZRISCgRyb2xlGAcgASgJUgRyb2xl');
@$core.Deprecated('Use createProductDescriptor instead')
const CreateProduct$json = const {
  '1': 'CreateProduct',
  '3': const [CreateProduct_Request$json, CreateProduct_Response$json],
};

@$core.Deprecated('Use createProductDescriptor instead')
const CreateProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.ProductDeliveryType', '10': 'type'},
    const {'1': 'categoryId', '3': 5, '4': 1, '5': 5, '10': 'categoryId'},
    const {'1': 'pictureBlob', '3': 6, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'price', '3': 7, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'currency', '3': 8, '4': 1, '5': 14, '6': '.Currency', '10': 'currency'},
    const {'1': 'description', '3': 9, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'contents', '3': 10, '4': 1, '5': 9, '10': 'contents'},
    const {'1': 'dynamicLink', '3': 11, '4': 1, '5': 9, '10': 'dynamicLink'},
  ],
};

@$core.Deprecated('Use createProductDescriptor instead')
const CreateProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
  ],
};

/// Descriptor for `CreateProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProductDescriptor = $convert.base64Decode('Cg1DcmVhdGVQcm9kdWN0Gu4CCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSJgoOYnVzaW5lc3NQYWdlSWQYAiABKAVSDmJ1c2luZXNzUGFnZUlkEhIKBG5hbWUYAyABKAlSBG5hbWUSKAoEdHlwZRgEIAEoDjIULlByb2R1Y3REZWxpdmVyeVR5cGVSBHR5cGUSHgoKY2F0ZWdvcnlJZBgFIAEoBVIKY2F0ZWdvcnlJZBIgCgtwaWN0dXJlQmxvYhgGIAEoDFILcGljdHVyZUJsb2ISFAoFcHJpY2UYByABKAJSBXByaWNlEiUKCGN1cnJlbmN5GAggASgOMgkuQ3VycmVuY3lSCGN1cnJlbmN5EiAKC2Rlc2NyaXB0aW9uGAkgASgJUgtkZXNjcmlwdGlvbhIaCghjb250ZW50cxgKIAEoCVIIY29udGVudHMSIAoLZHluYW1pY0xpbmsYCyABKAlSC2R5bmFtaWNMaW5rGkIKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHAoJcHJvZHVjdElkGAIgASgFUglwcm9kdWN0SWQ=');
@$core.Deprecated('Use updateProductDetailsDescriptor instead')
const UpdateProductDetails$json = const {
  '1': 'UpdateProductDetails',
  '3': const [UpdateProductDetails_Request$json, UpdateProductDetails_Response$json],
};

@$core.Deprecated('Use updateProductDetailsDescriptor instead')
const UpdateProductDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'businessPageId', '3': 3, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.ProductDeliveryType', '10': 'type'},
    const {'1': 'categoryId', '3': 6, '4': 1, '5': 5, '10': 'categoryId'},
    const {'1': 'pictureBlob', '3': 7, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'price', '3': 8, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'currency', '3': 9, '4': 1, '5': 14, '6': '.Currency', '10': 'currency'},
    const {'1': 'description', '3': 10, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'contents', '3': 11, '4': 1, '5': 9, '10': 'contents'},
    const {'1': 'dynamicLink', '3': 12, '4': 1, '5': 9, '10': 'dynamicLink'},
  ],
};

@$core.Deprecated('Use updateProductDetailsDescriptor instead')
const UpdateProductDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateProductDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProductDetailsDescriptor = $convert.base64Decode('ChRVcGRhdGVQcm9kdWN0RGV0YWlscxqMAwoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EhwKCXByb2R1Y3RJZBgCIAEoBVIJcHJvZHVjdElkEiYKDmJ1c2luZXNzUGFnZUlkGAMgASgFUg5idXNpbmVzc1BhZ2VJZBISCgRuYW1lGAQgASgJUgRuYW1lEigKBHR5cGUYBSABKA4yFC5Qcm9kdWN0RGVsaXZlcnlUeXBlUgR0eXBlEh4KCmNhdGVnb3J5SWQYBiABKAVSCmNhdGVnb3J5SWQSIAoLcGljdHVyZUJsb2IYByABKAxSC3BpY3R1cmVCbG9iEhQKBXByaWNlGAggASgCUgVwcmljZRIlCghjdXJyZW5jeRgJIAEoDjIJLkN1cnJlbmN5UghjdXJyZW5jeRIgCgtkZXNjcmlwdGlvbhgKIAEoCVILZGVzY3JpcHRpb24SGgoIY29udGVudHMYCyABKAlSCGNvbnRlbnRzEiAKC2R5bmFtaWNMaW5rGAwgASgJUgtkeW5hbWljTGluaxokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use uncreateProductDescriptor instead')
const UncreateProduct$json = const {
  '1': 'UncreateProduct',
  '3': const [UncreateProduct_Request$json, UncreateProduct_Response$json],
};

@$core.Deprecated('Use uncreateProductDescriptor instead')
const UncreateProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use uncreateProductDescriptor instead')
const UncreateProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UncreateProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uncreateProductDescriptor = $convert.base64Decode('Cg9VbmNyZWF0ZVByb2R1Y3QaKQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5GiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use fetchNextKProductIdsDescriptor instead')
const FetchNextKProductIds$json = const {
  '1': 'FetchNextKProductIds',
  '3': const [FetchNextKProductIds_Request$json, FetchNextKProductIds_Response$json],
};

@$core.Deprecated('Use fetchNextKProductIdsDescriptor instead')
const FetchNextKProductIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'k', '3': 1, '4': 1, '5': 5, '10': 'k'},
    const {'1': 'previousProductId', '3': 2, '4': 1, '5': 5, '10': 'previousProductId'},
    const {'1': 'filterDetails', '3': 3, '4': 1, '5': 11, '6': '.FilterDetails', '10': 'filterDetails'},
  ],
};

@$core.Deprecated('Use fetchNextKProductIdsDescriptor instead')
const FetchNextKProductIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchNextKProductIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchNextKProductIdsDescriptor = $convert.base64Decode('ChRGZXRjaE5leHRLUHJvZHVjdElkcxp7CgdSZXF1ZXN0EgwKAWsYASABKAVSAWsSLAoRcHJldmlvdXNQcm9kdWN0SWQYAiABKAVSEXByZXZpb3VzUHJvZHVjdElkEjQKDWZpbHRlckRldGFpbHMYAyABKAsyDi5GaWx0ZXJEZXRhaWxzUg1maWx0ZXJEZXRhaWxzGjQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSDgoCaWQYAiADKAVSAmlk');
@$core.Deprecated('Use fetchProductDetailsDescriptor instead')
const FetchProductDetails$json = const {
  '1': 'FetchProductDetails',
  '3': const [FetchProductDetails_Request$json, FetchProductDetails_Response$json],
};

@$core.Deprecated('Use fetchProductDetailsDescriptor instead')
const FetchProductDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'productId', '3': 1, '4': 1, '5': 5, '10': 'productId'},
  ],
};

@$core.Deprecated('Use fetchProductDetailsDescriptor instead')
const FetchProductDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.ProductDeliveryType', '10': 'type'},
    const {'1': 'categoryId', '3': 5, '4': 1, '5': 5, '10': 'categoryId'},
    const {'1': 'published', '3': 6, '4': 1, '5': 8, '10': 'published'},
    const {'1': 'pictureBlob', '3': 7, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'businessPageId', '3': 8, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'price', '3': 9, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'stars', '3': 10, '4': 1, '5': 1, '10': 'stars'},
    const {'1': 'reviewsCount', '3': 11, '4': 1, '5': 5, '10': 'reviewsCount'},
    const {'1': 'currency', '3': 12, '4': 1, '5': 14, '6': '.Currency', '10': 'currency'},
    const {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'contents', '3': 14, '4': 1, '5': 9, '10': 'contents'},
    const {'1': 'dynamicLink', '3': 15, '4': 1, '5': 9, '10': 'dynamicLink'},
  ],
};

/// Descriptor for `FetchProductDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchProductDetailsDescriptor = $convert.base64Decode('ChNGZXRjaFByb2R1Y3REZXRhaWxzGicKB1JlcXVlc3QSHAoJcHJvZHVjdElkGAEgASgFUglwcm9kdWN0SWQa0QMKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSDgoCaWQYAiABKAVSAmlkEhIKBG5hbWUYAyABKAlSBG5hbWUSKAoEdHlwZRgEIAEoDjIULlByb2R1Y3REZWxpdmVyeVR5cGVSBHR5cGUSHgoKY2F0ZWdvcnlJZBgFIAEoBVIKY2F0ZWdvcnlJZBIcCglwdWJsaXNoZWQYBiABKAhSCXB1Ymxpc2hlZBIgCgtwaWN0dXJlQmxvYhgHIAEoDFILcGljdHVyZUJsb2ISJgoOYnVzaW5lc3NQYWdlSWQYCCABKAVSDmJ1c2luZXNzUGFnZUlkEhQKBXByaWNlGAkgASgCUgVwcmljZRIUCgVzdGFycxgKIAEoAVIFc3RhcnMSIgoMcmV2aWV3c0NvdW50GAsgASgFUgxyZXZpZXdzQ291bnQSJQoIY3VycmVuY3kYDCABKA4yCS5DdXJyZW5jeVIIY3VycmVuY3kSIAoLZGVzY3JpcHRpb24YDSABKAlSC2Rlc2NyaXB0aW9uEhoKCGNvbnRlbnRzGA4gASgJUghjb250ZW50cxIgCgtkeW5hbWljTGluaxgPIAEoCVILZHluYW1pY0xpbms=');
@$core.Deprecated('Use publishProductDescriptor instead')
const PublishProduct$json = const {
  '1': 'PublishProduct',
  '3': const [PublishProduct_Request$json, PublishProduct_Response$json],
};

@$core.Deprecated('Use publishProductDescriptor instead')
const PublishProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
  ],
};

@$core.Deprecated('Use publishProductDescriptor instead')
const PublishProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `PublishProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishProductDescriptor = $convert.base64Decode('Cg5QdWJsaXNoUHJvZHVjdBpHCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSHAoJcHJvZHVjdElkGAIgASgFUglwcm9kdWN0SWQaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use unpublishProductDescriptor instead')
const UnpublishProduct$json = const {
  '1': 'UnpublishProduct',
  '3': const [UnpublishProduct_Request$json, UnpublishProduct_Response$json],
};

@$core.Deprecated('Use unpublishProductDescriptor instead')
const UnpublishProduct_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
  ],
};

@$core.Deprecated('Use unpublishProductDescriptor instead')
const UnpublishProduct_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UnpublishProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unpublishProductDescriptor = $convert.base64Decode('ChBVbnB1Ymxpc2hQcm9kdWN0GkcKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIcCglwcm9kdWN0SWQYAiABKAVSCXByb2R1Y3RJZBokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use fetchProductCategoryIdsDescriptor instead')
const FetchProductCategoryIds$json = const {
  '1': 'FetchProductCategoryIds',
  '3': const [FetchProductCategoryIds_Request$json, FetchProductCategoryIds_Response$json],
};

@$core.Deprecated('Use fetchProductCategoryIdsDescriptor instead')
const FetchProductCategoryIds_Request$json = const {
  '1': 'Request',
};

@$core.Deprecated('Use fetchProductCategoryIdsDescriptor instead')
const FetchProductCategoryIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchProductCategoryIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchProductCategoryIdsDescriptor = $convert.base64Decode('ChdGZXRjaFByb2R1Y3RDYXRlZ29yeUlkcxoJCgdSZXF1ZXN0GjQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSDgoCaWQYAiADKAVSAmlk');
@$core.Deprecated('Use fetchProductCategoryDetailsDescriptor instead')
const FetchProductCategoryDetails$json = const {
  '1': 'FetchProductCategoryDetails',
  '3': const [FetchProductCategoryDetails_Request$json, FetchProductCategoryDetails_Response$json],
};

@$core.Deprecated('Use fetchProductCategoryDetailsDescriptor instead')
const FetchProductCategoryDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'categoryId', '3': 1, '4': 1, '5': 5, '10': 'categoryId'},
  ],
};

@$core.Deprecated('Use fetchProductCategoryDetailsDescriptor instead')
const FetchProductCategoryDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'nameJsonStr', '3': 3, '4': 1, '5': 9, '10': 'nameJsonStr'},
    const {'1': 'pictureBlob', '3': 4, '4': 1, '5': 12, '10': 'pictureBlob'},
    const {'1': 'examplesJsonStr', '3': 5, '4': 1, '5': 9, '10': 'examplesJsonStr'},
  ],
};

/// Descriptor for `FetchProductCategoryDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchProductCategoryDetailsDescriptor = $convert.base64Decode('ChtGZXRjaFByb2R1Y3RDYXRlZ29yeURldGFpbHMaKQoHUmVxdWVzdBIeCgpjYXRlZ29yeUlkGAEgASgFUgpjYXRlZ29yeUlkGqIBCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEg4KAmlkGAIgASgFUgJpZBIgCgtuYW1lSnNvblN0chgDIAEoCVILbmFtZUpzb25TdHISIAoLcGljdHVyZUJsb2IYBCABKAxSC3BpY3R1cmVCbG9iEigKD2V4YW1wbGVzSnNvblN0chgFIAEoCVIPZXhhbXBsZXNKc29uU3Ry');
@$core.Deprecated('Use createNewContentDescriptor instead')
const CreateNewContent$json = const {
  '1': 'CreateNewContent',
  '3': const [CreateNewContent_Request$json, CreateNewContent_Response$json],
};

@$core.Deprecated('Use createNewContentDescriptor instead')
const CreateNewContent_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'fileId', '3': 3, '4': 1, '5': 9, '10': 'fileId'},
    const {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
  ],
};

@$core.Deprecated('Use createNewContentDescriptor instead')
const CreateNewContent_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'contentId', '3': 2, '4': 1, '5': 5, '10': 'contentId'},
  ],
};

/// Descriptor for `CreateNewContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNewContentDescriptor = $convert.base64Decode('ChBDcmVhdGVOZXdDb250ZW50GmkKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSFgoGZmlsZUlkGAMgASgJUgZmaWxlSWQSEAoDdXJsGAQgASgJUgN1cmwaQgoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIcCgljb250ZW50SWQYAiABKAVSCWNvbnRlbnRJZA==');
@$core.Deprecated('Use updateContentDescriptor instead')
const UpdateContent$json = const {
  '1': 'UpdateContent',
  '3': const [UpdateContent_Request$json, UpdateContent_Response$json],
};

@$core.Deprecated('Use updateContentDescriptor instead')
const UpdateContent_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'contentId', '3': 2, '4': 1, '5': 5, '10': 'contentId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'fileId', '3': 4, '4': 1, '5': 9, '10': 'fileId'},
    const {'1': 'url', '3': 5, '4': 1, '5': 9, '10': 'url'},
  ],
};

@$core.Deprecated('Use updateContentDescriptor instead')
const UpdateContent_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContentDescriptor = $convert.base64Decode('Cg1VcGRhdGVDb250ZW50GocBCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSHAoJY29udGVudElkGAIgASgFUgljb250ZW50SWQSFAoFdGl0bGUYAyABKAlSBXRpdGxlEhYKBmZpbGVJZBgEIAEoCVIGZmlsZUlkEhAKA3VybBgFIAEoCVIDdXJsGiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use fetchContentDetailsDescriptor instead')
const FetchContentDetails$json = const {
  '1': 'FetchContentDetails',
  '3': const [FetchContentDetails_Request$json, FetchContentDetails_Response$json],
};

@$core.Deprecated('Use fetchContentDetailsDescriptor instead')
const FetchContentDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'contentId', '3': 2, '4': 1, '5': 5, '10': 'contentId'},
  ],
};

@$core.Deprecated('Use fetchContentDetailsDescriptor instead')
const FetchContentDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'fileId', '3': 4, '4': 1, '5': 9, '10': 'fileId'},
    const {'1': 'url', '3': 5, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `FetchContentDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchContentDetailsDescriptor = $convert.base64Decode('ChNGZXRjaENvbnRlbnREZXRhaWxzGkcKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIcCgljb250ZW50SWQYAiABKAVSCWNvbnRlbnRJZBp0CghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEg4KAmlkGAIgASgFUgJpZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSFgoGZmlsZUlkGAQgASgJUgZmaWxlSWQSEAoDdXJsGAUgASgJUgN1cmw=');
@$core.Deprecated('Use deleteContentDescriptor instead')
const DeleteContent$json = const {
  '1': 'DeleteContent',
  '3': const [DeleteContent_Request$json, DeleteContent_Response$json],
};

@$core.Deprecated('Use deleteContentDescriptor instead')
const DeleteContent_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'contentId', '3': 2, '4': 1, '5': 5, '10': 'contentId'},
  ],
};

@$core.Deprecated('Use deleteContentDescriptor instead')
const DeleteContent_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteContentDescriptor = $convert.base64Decode('Cg1EZWxldGVDb250ZW50GkcKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIcCgljb250ZW50SWQYAiABKAVSCWNvbnRlbnRJZBokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use createVacantJobDescriptor instead')
const CreateVacantJob$json = const {
  '1': 'CreateVacantJob',
  '3': const [CreateVacantJob_Request$json, CreateVacantJob_Response$json],
};

@$core.Deprecated('Use createVacantJobDescriptor instead')
const CreateVacantJob_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
  ],
};

@$core.Deprecated('Use createVacantJobDescriptor instead')
const CreateVacantJob_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateVacantJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createVacantJobDescriptor = $convert.base64Decode('Cg9DcmVhdGVWYWNhbnRKb2IaZwoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EiYKDmJ1c2luZXNzUGFnZUlkGAIgASgFUg5idXNpbmVzc1BhZ2VJZBIUCgV0aXRsZRgDIAEoCVIFdGl0bGUaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use updateJobDetailsDescriptor instead')
const UpdateJobDetails$json = const {
  '1': 'UpdateJobDetails',
  '3': const [UpdateJobDetails_Request$json, UpdateJobDetails_Response$json],
};

@$core.Deprecated('Use updateJobDetailsDescriptor instead')
const UpdateJobDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use updateJobDetailsDescriptor instead')
const UpdateJobDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateJobDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateJobDetailsDescriptor = $convert.base64Decode('ChBVcGRhdGVKb2JEZXRhaWxzGikKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use uncreateJobDescriptor instead')
const UncreateJob$json = const {
  '1': 'UncreateJob',
  '3': const [UncreateJob_Request$json, UncreateJob_Response$json],
};

@$core.Deprecated('Use uncreateJobDescriptor instead')
const UncreateJob_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use uncreateJobDescriptor instead')
const UncreateJob_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UncreateJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uncreateJobDescriptor = $convert.base64Decode('CgtVbmNyZWF0ZUpvYhopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use fetchBusinessPageJobIdsDescriptor instead')
const FetchBusinessPageJobIds$json = const {
  '1': 'FetchBusinessPageJobIds',
  '3': const [FetchBusinessPageJobIds_Request$json, FetchBusinessPageJobIds_Response$json],
};

@$core.Deprecated('Use fetchBusinessPageJobIdsDescriptor instead')
const FetchBusinessPageJobIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'businessPageId', '3': 2, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

@$core.Deprecated('Use fetchBusinessPageJobIdsDescriptor instead')
const FetchBusinessPageJobIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchBusinessPageJobIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchBusinessPageJobIdsDescriptor = $convert.base64Decode('ChdGZXRjaEJ1c2luZXNzUGFnZUpvYklkcxpRCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSJgoOYnVzaW5lc3NQYWdlSWQYAiABKAVSDmJ1c2luZXNzUGFnZUlkGjQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSDgoCaWQYAiADKAVSAmlk');
@$core.Deprecated('Use fetchNextKVacantJobIdsDescriptor instead')
const FetchNextKVacantJobIds$json = const {
  '1': 'FetchNextKVacantJobIds',
  '3': const [FetchNextKVacantJobIds_Request$json, FetchNextKVacantJobIds_Response$json],
};

@$core.Deprecated('Use fetchNextKVacantJobIdsDescriptor instead')
const FetchNextKVacantJobIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'k', '3': 2, '4': 1, '5': 5, '10': 'k'},
    const {'1': 'previousVacantJobId', '3': 3, '4': 1, '5': 5, '10': 'previousVacantJobId'},
    const {'1': 'filterDetails', '3': 4, '4': 1, '5': 11, '6': '.FilterDetails', '10': 'filterDetails'},
  ],
};

@$core.Deprecated('Use fetchNextKVacantJobIdsDescriptor instead')
const FetchNextKVacantJobIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchNextKVacantJobIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchNextKVacantJobIdsDescriptor = $convert.base64Decode('ChZGZXRjaE5leHRLVmFjYW50Sm9iSWRzGp8BCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSDAoBaxgCIAEoBVIBaxIwChNwcmV2aW91c1ZhY2FudEpvYklkGAMgASgFUhNwcmV2aW91c1ZhY2FudEpvYklkEjQKDWZpbHRlckRldGFpbHMYBCABKAsyDi5GaWx0ZXJEZXRhaWxzUg1maWx0ZXJEZXRhaWxzGjQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSDgoCaWQYAiADKAVSAmlk');
@$core.Deprecated('Use fetchJobDetailsDescriptor instead')
const FetchJobDetails$json = const {
  '1': 'FetchJobDetails',
  '3': const [FetchJobDetails_Request$json, FetchJobDetails_Response$json],
};

@$core.Deprecated('Use fetchJobDetailsDescriptor instead')
const FetchJobDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
  ],
};

@$core.Deprecated('Use fetchJobDetailsDescriptor instead')
const FetchJobDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'businessPageId', '3': 3, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'role', '3': 4, '4': 1, '5': 9, '10': 'role'},
    const {'1': 'title', '3': 5, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'hiredUserId', '3': 6, '4': 1, '5': 5, '10': 'hiredUserId'},
  ],
};

/// Descriptor for `FetchJobDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchJobDetailsDescriptor = $convert.base64Decode('Cg9GZXRjaEpvYkRldGFpbHMaPwoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EhQKBWpvYklkGAIgASgFUgVqb2JJZBqoAQoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAEoBVICaWQSJgoOYnVzaW5lc3NQYWdlSWQYAyABKAVSDmJ1c2luZXNzUGFnZUlkEhIKBHJvbGUYBCABKAlSBHJvbGUSFAoFdGl0bGUYBSABKAlSBXRpdGxlEiAKC2hpcmVkVXNlcklkGAYgASgFUgtoaXJlZFVzZXJJZA==');
@$core.Deprecated('Use createJobApplicationDescriptor instead')
const CreateJobApplication$json = const {
  '1': 'CreateJobApplication',
  '3': const [CreateJobApplication_Request$json, CreateJobApplication_Response$json],
};

@$core.Deprecated('Use createJobApplicationDescriptor instead')
const CreateJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'contents', '3': 4, '4': 1, '5': 9, '10': 'contents'},
  ],
};

@$core.Deprecated('Use createJobApplicationDescriptor instead')
const CreateJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateJobApplication`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createJobApplicationDescriptor = $convert.base64Decode('ChRDcmVhdGVKb2JBcHBsaWNhdGlvbhp1CgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSFAoFam9iSWQYAiABKAVSBWpvYklkEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USGgoIY29udGVudHMYBCABKAlSCGNvbnRlbnRzGiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use updateJobApplicationDetailsDescriptor instead')
const UpdateJobApplicationDetails$json = const {
  '1': 'UpdateJobApplicationDetails',
  '3': const [UpdateJobApplicationDetails_Request$json, UpdateJobApplicationDetails_Response$json],
};

@$core.Deprecated('Use updateJobApplicationDetailsDescriptor instead')
const UpdateJobApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use updateJobApplicationDetailsDescriptor instead')
const UpdateJobApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateJobApplicationDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateJobApplicationDetailsDescriptor = $convert.base64Decode('ChtVcGRhdGVKb2JBcHBsaWNhdGlvbkRldGFpbHMaKQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5GiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use uncreateJobApplicationDescriptor instead')
const UncreateJobApplication$json = const {
  '1': 'UncreateJobApplication',
  '3': const [UncreateJobApplication_Request$json, UncreateJobApplication_Response$json],
};

@$core.Deprecated('Use uncreateJobApplicationDescriptor instead')
const UncreateJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use uncreateJobApplicationDescriptor instead')
const UncreateJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UncreateJobApplication`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uncreateJobApplicationDescriptor = $convert.base64Decode('ChZVbmNyZWF0ZUpvYkFwcGxpY2F0aW9uGikKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use fetchJobApplicationIdsDescriptor instead')
const FetchJobApplicationIds$json = const {
  '1': 'FetchJobApplicationIds',
  '3': const [FetchJobApplicationIds_Request$json, FetchJobApplicationIds_Response$json],
};

@$core.Deprecated('Use fetchJobApplicationIdsDescriptor instead')
const FetchJobApplicationIds_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobId', '3': 2, '4': 1, '5': 5, '10': 'jobId'},
  ],
};

@$core.Deprecated('Use fetchJobApplicationIdsDescriptor instead')
const FetchJobApplicationIds_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `FetchJobApplicationIds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchJobApplicationIdsDescriptor = $convert.base64Decode('ChZGZXRjaEpvYkFwcGxpY2F0aW9uSWRzGj8KB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIUCgVqb2JJZBgCIAEoBVIFam9iSWQaNAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAMoBVICaWQ=');
@$core.Deprecated('Use fetchJobApplicationDetailsDescriptor instead')
const FetchJobApplicationDetails$json = const {
  '1': 'FetchJobApplicationDetails',
  '3': const [FetchJobApplicationDetails_Request$json, FetchJobApplicationDetails_Response$json],
};

@$core.Deprecated('Use fetchJobApplicationDetailsDescriptor instead')
const FetchJobApplicationDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

@$core.Deprecated('Use fetchJobApplicationDetailsDescriptor instead')
const FetchJobApplicationDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'applicantId', '3': 4, '4': 1, '5': 5, '10': 'applicantId'},
    const {'1': 'contents', '3': 5, '4': 1, '5': 9, '10': 'contents'},
  ],
};

/// Descriptor for `FetchJobApplicationDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchJobApplicationDetailsDescriptor = $convert.base64Decode('ChpGZXRjaEpvYkFwcGxpY2F0aW9uRGV0YWlscxpVCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSKgoQam9iQXBwbGljYXRpb25JZBgCIAEoBVIQam9iQXBwbGljYXRpb25JZBqMAQoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAEoBVICaWQSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIgCgthcHBsaWNhbnRJZBgEIAEoBVILYXBwbGljYW50SWQSGgoIY29udGVudHMYBSABKAlSCGNvbnRlbnRz');
@$core.Deprecated('Use approveJobApplicationDescriptor instead')
const ApproveJobApplication$json = const {
  '1': 'ApproveJobApplication',
  '3': const [ApproveJobApplication_Request$json, ApproveJobApplication_Response$json],
};

@$core.Deprecated('Use approveJobApplicationDescriptor instead')
const ApproveJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

@$core.Deprecated('Use approveJobApplicationDescriptor instead')
const ApproveJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ApproveJobApplication`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveJobApplicationDescriptor = $convert.base64Decode('ChVBcHByb3ZlSm9iQXBwbGljYXRpb24aVQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EioKEGpvYkFwcGxpY2F0aW9uSWQYAiABKAVSEGpvYkFwcGxpY2F0aW9uSWQaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use declineJobApplicationDescriptor instead')
const DeclineJobApplication$json = const {
  '1': 'DeclineJobApplication',
  '3': const [DeclineJobApplication_Request$json, DeclineJobApplication_Response$json],
};

@$core.Deprecated('Use declineJobApplicationDescriptor instead')
const DeclineJobApplication_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'jobApplicationId', '3': 2, '4': 1, '5': 5, '10': 'jobApplicationId'},
  ],
};

@$core.Deprecated('Use declineJobApplicationDescriptor instead')
const DeclineJobApplication_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeclineJobApplication`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List declineJobApplicationDescriptor = $convert.base64Decode('ChVEZWNsaW5lSm9iQXBwbGljYXRpb24aVQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EioKEGpvYkFwcGxpY2F0aW9uSWQYAiABKAVSEGpvYkFwcGxpY2F0aW9uSWQaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use logPurchaseDescriptor instead')
const LogPurchase$json = const {
  '1': 'LogPurchase',
  '3': const [LogPurchase_Request$json, LogPurchase_Response$json],
};

@$core.Deprecated('Use logPurchaseDescriptor instead')
const LogPurchase_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use logPurchaseDescriptor instead')
const LogPurchase_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `LogPurchase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logPurchaseDescriptor = $convert.base64Decode('CgtMb2dQdXJjaGFzZRopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use fetchPurchasesDescriptor instead')
const FetchPurchases$json = const {
  '1': 'FetchPurchases',
  '3': const [FetchPurchases_Request$json, FetchPurchases_Response$json],
};

@$core.Deprecated('Use fetchPurchasesDescriptor instead')
const FetchPurchases_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use fetchPurchasesDescriptor instead')
const FetchPurchases_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `FetchPurchases`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPurchasesDescriptor = $convert.base64Decode('Cg5GZXRjaFB1cmNoYXNlcxopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use fetchPurchaseDetailsDescriptor instead')
const FetchPurchaseDetails$json = const {
  '1': 'FetchPurchaseDetails',
  '3': const [FetchPurchaseDetails_Request$json, FetchPurchaseDetails_Response$json],
};

@$core.Deprecated('Use fetchPurchaseDetailsDescriptor instead')
const FetchPurchaseDetails_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
  ],
};

@$core.Deprecated('Use fetchPurchaseDetailsDescriptor instead')
const FetchPurchaseDetails_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `FetchPurchaseDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchPurchaseDetailsDescriptor = $convert.base64Decode('ChRGZXRjaFB1cmNoYXNlRGV0YWlscxopCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use submitProductReviewDescriptor instead')
const SubmitProductReview$json = const {
  '1': 'SubmitProductReview',
  '3': const [SubmitProductReview_Request$json, SubmitProductReview_Response$json],
};

@$core.Deprecated('Use submitProductReviewDescriptor instead')
const SubmitProductReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
    const {'1': 'stars', '3': 3, '4': 1, '5': 5, '10': 'stars'},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use submitProductReviewDescriptor instead')
const SubmitProductReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SubmitProductReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitProductReviewDescriptor = $convert.base64Decode('ChNTdWJtaXRQcm9kdWN0UmV2aWV3Go8BCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSHAoJcHJvZHVjdElkGAIgASgFUglwcm9kdWN0SWQSFAoFc3RhcnMYAyABKAVSBXN0YXJzEhIKBHRleHQYBCABKAlSBHRleHQSHAoJdGltZXN0YW1wGAUgASgDUgl0aW1lc3RhbXAaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use retrieveProductReviewsDescriptor instead')
const RetrieveProductReviews$json = const {
  '1': 'RetrieveProductReviews',
  '3': const [RetrieveProductReviews_Request$json, RetrieveProductReviews_Response$json],
};

@$core.Deprecated('Use retrieveProductReviewsDescriptor instead')
const RetrieveProductReviews_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'productId', '3': 2, '4': 1, '5': 5, '10': 'productId'},
  ],
};

@$core.Deprecated('Use retrieveProductReviewsDescriptor instead')
const RetrieveProductReviews_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
    const {'1': 'isMyReview', '3': 3, '4': 3, '5': 8, '10': 'isMyReview'},
    const {'1': 'stars', '3': 4, '4': 3, '5': 5, '10': 'stars'},
    const {'1': 'text', '3': 5, '4': 3, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 6, '4': 3, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `RetrieveProductReviews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retrieveProductReviewsDescriptor = $convert.base64Decode('ChZSZXRyaWV2ZVByb2R1Y3RSZXZpZXdzGkcKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIcCglwcm9kdWN0SWQYAiABKAVSCXByb2R1Y3RJZBqcAQoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIOCgJpZBgCIAMoBVICaWQSHgoKaXNNeVJldmlldxgDIAMoCFIKaXNNeVJldmlldxIUCgVzdGFycxgEIAMoBVIFc3RhcnMSEgoEdGV4dBgFIAMoCVIEdGV4dBIcCgl0aW1lc3RhbXAYBiADKANSCXRpbWVzdGFtcA==');
@$core.Deprecated('Use editProductReviewDescriptor instead')
const EditProductReview$json = const {
  '1': 'EditProductReview',
  '3': const [EditProductReview_Request$json, EditProductReview_Response$json],
};

@$core.Deprecated('Use editProductReviewDescriptor instead')
const EditProductReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'reviewId', '3': 2, '4': 1, '5': 5, '10': 'reviewId'},
    const {'1': 'stars', '3': 3, '4': 1, '5': 5, '10': 'stars'},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use editProductReviewDescriptor instead')
const EditProductReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditProductReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editProductReviewDescriptor = $convert.base64Decode('ChFFZGl0UHJvZHVjdFJldmlldxqNAQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EhoKCHJldmlld0lkGAIgASgFUghyZXZpZXdJZBIUCgVzdGFycxgDIAEoBVIFc3RhcnMSEgoEdGV4dBgEIAEoCVIEdGV4dBIcCgl0aW1lc3RhbXAYBSABKANSCXRpbWVzdGFtcBokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use deleteProductReviewDescriptor instead')
const DeleteProductReview$json = const {
  '1': 'DeleteProductReview',
  '3': const [DeleteProductReview_Request$json, DeleteProductReview_Response$json],
};

@$core.Deprecated('Use deleteProductReviewDescriptor instead')
const DeleteProductReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'reviewId', '3': 2, '4': 1, '5': 5, '10': 'reviewId'},
  ],
};

@$core.Deprecated('Use deleteProductReviewDescriptor instead')
const DeleteProductReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteProductReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProductReviewDescriptor = $convert.base64Decode('ChNEZWxldGVQcm9kdWN0UmV2aWV3GkUKB1JlcXVlc3QSHgoKc2Vzc2lvbktleRgBIAEoCVIKc2Vzc2lvbktleRIaCghyZXZpZXdJZBgCIAEoBVIIcmV2aWV3SWQaJAoIUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
@$core.Deprecated('Use submitEmployeeReviewDescriptor instead')
const SubmitEmployeeReview$json = const {
  '1': 'SubmitEmployeeReview',
  '3': const [SubmitEmployeeReview_Request$json, SubmitEmployeeReview_Response$json],
};

@$core.Deprecated('Use submitEmployeeReviewDescriptor instead')
const SubmitEmployeeReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'employeeUserId', '3': 2, '4': 1, '5': 5, '10': 'employeeUserId'},
    const {'1': 'businessPageId', '3': 3, '4': 1, '5': 5, '10': 'businessPageId'},
    const {'1': 'text', '3': 4, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use submitEmployeeReviewDescriptor instead')
const SubmitEmployeeReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SubmitEmployeeReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitEmployeeReviewDescriptor = $convert.base64Decode('ChRTdWJtaXRFbXBsb3llZVJldmlldxqrAQoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EiYKDmVtcGxveWVlVXNlcklkGAIgASgFUg5lbXBsb3llZVVzZXJJZBImCg5idXNpbmVzc1BhZ2VJZBgDIAEoBVIOYnVzaW5lc3NQYWdlSWQSEgoEdGV4dBgEIAEoCVIEdGV4dBIcCgl0aW1lc3RhbXAYBSABKANSCXRpbWVzdGFtcBokCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');
@$core.Deprecated('Use retrieveEmployeeReviewsDescriptor instead')
const RetrieveEmployeeReviews$json = const {
  '1': 'RetrieveEmployeeReviews',
  '3': const [RetrieveEmployeeReviews_Request$json, RetrieveEmployeeReviews_Response$json],
};

@$core.Deprecated('Use retrieveEmployeeReviewsDescriptor instead')
const RetrieveEmployeeReviews_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'employeeUserId', '3': 2, '4': 1, '5': 5, '10': 'employeeUserId'},
    const {'1': 'businessPageId', '3': 3, '4': 1, '5': 5, '10': 'businessPageId'},
  ],
};

@$core.Deprecated('Use retrieveEmployeeReviewsDescriptor instead')
const RetrieveEmployeeReviews_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 3, '5': 5, '10': 'id'},
    const {'1': 'text', '3': 3, '4': 3, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 4, '4': 3, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `RetrieveEmployeeReviews`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retrieveEmployeeReviewsDescriptor = $convert.base64Decode('ChdSZXRyaWV2ZUVtcGxveWVlUmV2aWV3cxp5CgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSJgoOZW1wbG95ZWVVc2VySWQYAiABKAVSDmVtcGxveWVlVXNlcklkEiYKDmJ1c2luZXNzUGFnZUlkGAMgASgFUg5idXNpbmVzc1BhZ2VJZBpmCghSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEg4KAmlkGAIgAygFUgJpZBISCgR0ZXh0GAMgAygJUgR0ZXh0EhwKCXRpbWVzdGFtcBgEIAMoA1IJdGltZXN0YW1w');
@$core.Deprecated('Use editEmployeeReviewDescriptor instead')
const EditEmployeeReview$json = const {
  '1': 'EditEmployeeReview',
  '3': const [EditEmployeeReview_Request$json, EditEmployeeReview_Response$json],
};

@$core.Deprecated('Use editEmployeeReviewDescriptor instead')
const EditEmployeeReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'reviewId', '3': 2, '4': 1, '5': 5, '10': 'reviewId'},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use editEmployeeReviewDescriptor instead')
const EditEmployeeReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EditEmployeeReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editEmployeeReviewDescriptor = $convert.base64Decode('ChJFZGl0RW1wbG95ZWVSZXZpZXcadwoHUmVxdWVzdBIeCgpzZXNzaW9uS2V5GAEgASgJUgpzZXNzaW9uS2V5EhoKCHJldmlld0lkGAIgASgFUghyZXZpZXdJZBISCgR0ZXh0GAMgASgJUgR0ZXh0EhwKCXRpbWVzdGFtcBgEIAEoA1IJdGltZXN0YW1wGiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
@$core.Deprecated('Use deleteEmployeeReviewDescriptor instead')
const DeleteEmployeeReview$json = const {
  '1': 'DeleteEmployeeReview',
  '3': const [DeleteEmployeeReview_Request$json, DeleteEmployeeReview_Response$json],
};

@$core.Deprecated('Use deleteEmployeeReviewDescriptor instead')
const DeleteEmployeeReview_Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'sessionKey', '3': 1, '4': 1, '5': 9, '10': 'sessionKey'},
    const {'1': 'reviewId', '3': 2, '4': 1, '5': 5, '10': 'reviewId'},
  ],
};

@$core.Deprecated('Use deleteEmployeeReviewDescriptor instead')
const DeleteEmployeeReview_Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteEmployeeReview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEmployeeReviewDescriptor = $convert.base64Decode('ChREZWxldGVFbXBsb3llZVJldmlldxpFCgdSZXF1ZXN0Eh4KCnNlc3Npb25LZXkYASABKAlSCnNlc3Npb25LZXkSGgoIcmV2aWV3SWQYAiABKAVSCHJldmlld0lkGiQKCFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
