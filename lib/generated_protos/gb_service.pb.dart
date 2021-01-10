///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'gb_service.pbenum.dart';

export 'gb_service.pbenum.dart';

class FilterDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FilterDetails', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'useFilter', protoName: 'useFilter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'substring')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regex')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryId', $pb.PbFieldType.O3, protoName: 'categoryId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..hasRequiredFields = false
  ;

  FilterDetails._() : super();
  factory FilterDetails({
    $core.bool useFilter,
    $core.String substring,
    $core.String regex,
    $core.int categoryId,
    $core.int businessPageId,
  }) {
    final _result = create();
    if (useFilter != null) {
      _result.useFilter = useFilter;
    }
    if (substring != null) {
      _result.substring = substring;
    }
    if (regex != null) {
      _result.regex = regex;
    }
    if (categoryId != null) {
      _result.categoryId = categoryId;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    return _result;
  }
  factory FilterDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterDetails clone() => FilterDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterDetails copyWith(void Function(FilterDetails) updates) => super.copyWith((message) => updates(message as FilterDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterDetails create() => FilterDetails._();
  FilterDetails createEmptyInstance() => create();
  static $pb.PbList<FilterDetails> createRepeated() => $pb.PbList<FilterDetails>();
  @$core.pragma('dart2js:noInline')
  static FilterDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterDetails>(create);
  static FilterDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get useFilter => $_getBF(0);
  @$pb.TagNumber(1)
  set useFilter($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUseFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearUseFilter() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get substring => $_getSZ(1);
  @$pb.TagNumber(2)
  set substring($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubstring() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubstring() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get regex => $_getSZ(2);
  @$pb.TagNumber(3)
  set regex($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegex() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get categoryId => $_getIZ(3);
  @$pb.TagNumber(4)
  set categoryId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategoryId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategoryId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get businessPageId => $_getIZ(4);
  @$pb.TagNumber(5)
  set businessPageId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBusinessPageId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBusinessPageId() => clearField(5);
}

class AuthenticateUser_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthenticateUser.Request', createEmptyInstance: create)
    ..e<AuthenticateUser_AuthMethod>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'method', $pb.PbFieldType.OE, defaultOrMaker: AuthenticateUser_AuthMethod.GOOGLE, valueOf: AuthenticateUser_AuthMethod.valueOf, enumValues: AuthenticateUser_AuthMethod.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokensJson', protoName: 'tokensJson')
    ..hasRequiredFields = false
  ;

  AuthenticateUser_Request._() : super();
  factory AuthenticateUser_Request({
    AuthenticateUser_AuthMethod method,
    $core.String tokensJson,
  }) {
    final _result = create();
    if (method != null) {
      _result.method = method;
    }
    if (tokensJson != null) {
      _result.tokensJson = tokensJson;
    }
    return _result;
  }
  factory AuthenticateUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthenticateUser_Request clone() => AuthenticateUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthenticateUser_Request copyWith(void Function(AuthenticateUser_Request) updates) => super.copyWith((message) => updates(message as AuthenticateUser_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser_Request create() => AuthenticateUser_Request._();
  AuthenticateUser_Request createEmptyInstance() => create();
  static $pb.PbList<AuthenticateUser_Request> createRepeated() => $pb.PbList<AuthenticateUser_Request>();
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthenticateUser_Request>(create);
  static AuthenticateUser_Request _defaultInstance;

  @$pb.TagNumber(1)
  AuthenticateUser_AuthMethod get method => $_getN(0);
  @$pb.TagNumber(1)
  set method(AuthenticateUser_AuthMethod v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMethod() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethod() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tokensJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set tokensJson($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokensJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokensJson() => clearField(2);
}

class AuthenticateUser_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthenticateUser.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  AuthenticateUser_Response._() : super();
  factory AuthenticateUser_Response({
    $core.bool success,
    $core.int userId,
    $core.String sessionKey,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory AuthenticateUser_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthenticateUser_Response clone() => AuthenticateUser_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthenticateUser_Response copyWith(void Function(AuthenticateUser_Response) updates) => super.copyWith((message) => updates(message as AuthenticateUser_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser_Response create() => AuthenticateUser_Response._();
  AuthenticateUser_Response createEmptyInstance() => create();
  static $pb.PbList<AuthenticateUser_Response> createRepeated() => $pb.PbList<AuthenticateUser_Response>();
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthenticateUser_Response>(create);
  static AuthenticateUser_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sessionKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSessionKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionKey() => clearField(3);
}

class AuthenticateUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthenticateUser', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AuthenticateUser._() : super();
  factory AuthenticateUser() => create();
  factory AuthenticateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthenticateUser clone() => AuthenticateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthenticateUser copyWith(void Function(AuthenticateUser) updates) => super.copyWith((message) => updates(message as AuthenticateUser)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser create() => AuthenticateUser._();
  AuthenticateUser createEmptyInstance() => create();
  static $pb.PbList<AuthenticateUser> createRepeated() => $pb.PbList<AuthenticateUser>();
  @$core.pragma('dart2js:noInline')
  static AuthenticateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthenticateUser>(create);
  static AuthenticateUser _defaultInstance;
}

class DeactivateUser_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeactivateUser.Request', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', $pb.PbFieldType.O3, protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  DeactivateUser_Request._() : super();
  factory DeactivateUser_Request({
    $core.int sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory DeactivateUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeactivateUser_Request clone() => DeactivateUser_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeactivateUser_Request copyWith(void Function(DeactivateUser_Request) updates) => super.copyWith((message) => updates(message as DeactivateUser_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeactivateUser_Request create() => DeactivateUser_Request._();
  DeactivateUser_Request createEmptyInstance() => create();
  static $pb.PbList<DeactivateUser_Request> createRepeated() => $pb.PbList<DeactivateUser_Request>();
  @$core.pragma('dart2js:noInline')
  static DeactivateUser_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeactivateUser_Request>(create);
  static DeactivateUser_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sessionKey => $_getIZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class DeactivateUser_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeactivateUser.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  DeactivateUser_Response._() : super();
  factory DeactivateUser_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory DeactivateUser_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeactivateUser_Response clone() => DeactivateUser_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeactivateUser_Response copyWith(void Function(DeactivateUser_Response) updates) => super.copyWith((message) => updates(message as DeactivateUser_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeactivateUser_Response create() => DeactivateUser_Response._();
  DeactivateUser_Response createEmptyInstance() => create();
  static $pb.PbList<DeactivateUser_Response> createRepeated() => $pb.PbList<DeactivateUser_Response>();
  @$core.pragma('dart2js:noInline')
  static DeactivateUser_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeactivateUser_Response>(create);
  static DeactivateUser_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class DeactivateUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeactivateUser', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeactivateUser._() : super();
  factory DeactivateUser() => create();
  factory DeactivateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeactivateUser clone() => DeactivateUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeactivateUser copyWith(void Function(DeactivateUser) updates) => super.copyWith((message) => updates(message as DeactivateUser)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeactivateUser create() => DeactivateUser._();
  DeactivateUser createEmptyInstance() => create();
  static $pb.PbList<DeactivateUser> createRepeated() => $pb.PbList<DeactivateUser>();
  @$core.pragma('dart2js:noInline')
  static DeactivateUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeactivateUser>(create);
  static DeactivateUser _defaultInstance;
}

class UpdateUserDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateUserDetails_Request._() : super();
  factory UpdateUserDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UpdateUserDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserDetails_Request clone() => UpdateUserDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserDetails_Request copyWith(void Function(UpdateUserDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateUserDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails_Request create() => UpdateUserDetails_Request._();
  UpdateUserDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateUserDetails_Request> createRepeated() => $pb.PbList<UpdateUserDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserDetails_Request>(create);
  static UpdateUserDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateUserDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateUserDetails_Response._() : super();
  factory UpdateUserDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateUserDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserDetails_Response clone() => UpdateUserDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserDetails_Response copyWith(void Function(UpdateUserDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateUserDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails_Response create() => UpdateUserDetails_Response._();
  UpdateUserDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateUserDetails_Response> createRepeated() => $pb.PbList<UpdateUserDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserDetails_Response>(create);
  static UpdateUserDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateUserDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateUserDetails._() : super();
  factory UpdateUserDetails() => create();
  factory UpdateUserDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserDetails clone() => UpdateUserDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserDetails copyWith(void Function(UpdateUserDetails) updates) => super.copyWith((message) => updates(message as UpdateUserDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails create() => UpdateUserDetails._();
  UpdateUserDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateUserDetails> createRepeated() => $pb.PbList<UpdateUserDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserDetails>(create);
  static UpdateUserDetails _defaultInstance;
}

class FetchUserDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchUserDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', $pb.PbFieldType.O3, protoName: 'userId')
    ..hasRequiredFields = false
  ;

  FetchUserDetails_Request._() : super();
  factory FetchUserDetails_Request({
    $core.String sessionKey,
    $core.int userId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory FetchUserDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserDetails_Request clone() => FetchUserDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserDetails_Request copyWith(void Function(FetchUserDetails_Request) updates) => super.copyWith((message) => updates(message as FetchUserDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails_Request create() => FetchUserDetails_Request._();
  FetchUserDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchUserDetails_Request> createRepeated() => $pb.PbList<FetchUserDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserDetails_Request>(create);
  static FetchUserDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class FetchUserDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchUserDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'picture')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..hasRequiredFields = false
  ;

  FetchUserDetails_Response._() : super();
  factory FetchUserDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String email,
    $core.String name,
    $core.String picture,
    $core.List<$core.int> pictureBlob,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (email != null) {
      _result.email = email;
    }
    if (name != null) {
      _result.name = name;
    }
    if (picture != null) {
      _result.picture = picture;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    return _result;
  }
  factory FetchUserDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserDetails_Response clone() => FetchUserDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserDetails_Response copyWith(void Function(FetchUserDetails_Response) updates) => super.copyWith((message) => updates(message as FetchUserDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails_Response create() => FetchUserDetails_Response._();
  FetchUserDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchUserDetails_Response> createRepeated() => $pb.PbList<FetchUserDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserDetails_Response>(create);
  static FetchUserDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get picture => $_getSZ(4);
  @$pb.TagNumber(5)
  set picture($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPicture() => $_has(4);
  @$pb.TagNumber(5)
  void clearPicture() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get pictureBlob => $_getN(5);
  @$pb.TagNumber(6)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPictureBlob() => $_has(5);
  @$pb.TagNumber(6)
  void clearPictureBlob() => clearField(6);
}

class FetchUserDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchUserDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchUserDetails._() : super();
  factory FetchUserDetails() => create();
  factory FetchUserDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserDetails clone() => FetchUserDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserDetails copyWith(void Function(FetchUserDetails) updates) => super.copyWith((message) => updates(message as FetchUserDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails create() => FetchUserDetails._();
  FetchUserDetails createEmptyInstance() => create();
  static $pb.PbList<FetchUserDetails> createRepeated() => $pb.PbList<FetchUserDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserDetails>(create);
  static FetchUserDetails _defaultInstance;
}

class CreateBusinessPage_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateBusinessPage.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..hasRequiredFields = false
  ;

  CreateBusinessPage_Request._() : super();
  factory CreateBusinessPage_Request({
    $core.String sessionKey,
    $core.String title,
    $core.List<$core.int> pictureBlob,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (title != null) {
      _result.title = title;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    return _result;
  }
  factory CreateBusinessPage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessPage_Request clone() => CreateBusinessPage_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessPage_Request copyWith(void Function(CreateBusinessPage_Request) updates) => super.copyWith((message) => updates(message as CreateBusinessPage_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage_Request create() => CreateBusinessPage_Request._();
  CreateBusinessPage_Request createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessPage_Request> createRepeated() => $pb.PbList<CreateBusinessPage_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessPage_Request>(create);
  static CreateBusinessPage_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get pictureBlob => $_getN(2);
  @$pb.TagNumber(3)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPictureBlob() => $_has(2);
  @$pb.TagNumber(3)
  void clearPictureBlob() => clearField(3);
}

class CreateBusinessPage_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateBusinessPage.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CreateBusinessPage_Response._() : super();
  factory CreateBusinessPage_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CreateBusinessPage_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessPage_Response clone() => CreateBusinessPage_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessPage_Response copyWith(void Function(CreateBusinessPage_Response) updates) => super.copyWith((message) => updates(message as CreateBusinessPage_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage_Response create() => CreateBusinessPage_Response._();
  CreateBusinessPage_Response createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessPage_Response> createRepeated() => $pb.PbList<CreateBusinessPage_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessPage_Response>(create);
  static CreateBusinessPage_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateBusinessPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateBusinessPage', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateBusinessPage._() : super();
  factory CreateBusinessPage() => create();
  factory CreateBusinessPage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateBusinessPage clone() => CreateBusinessPage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateBusinessPage copyWith(void Function(CreateBusinessPage) updates) => super.copyWith((message) => updates(message as CreateBusinessPage)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage create() => CreateBusinessPage._();
  CreateBusinessPage createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessPage> createRepeated() => $pb.PbList<CreateBusinessPage>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateBusinessPage>(create);
  static CreateBusinessPage _defaultInstance;
}

class UpdateBusinessPageDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateBusinessPageDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails_Request._() : super();
  factory UpdateBusinessPageDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UpdateBusinessPageDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails_Request clone() => UpdateBusinessPageDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails_Request copyWith(void Function(UpdateBusinessPageDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails_Request create() => UpdateBusinessPageDetails_Request._();
  UpdateBusinessPageDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessPageDetails_Request> createRepeated() => $pb.PbList<UpdateBusinessPageDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessPageDetails_Request>(create);
  static UpdateBusinessPageDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateBusinessPageDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateBusinessPageDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails_Response._() : super();
  factory UpdateBusinessPageDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateBusinessPageDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails_Response clone() => UpdateBusinessPageDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails_Response copyWith(void Function(UpdateBusinessPageDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails_Response create() => UpdateBusinessPageDetails_Response._();
  UpdateBusinessPageDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessPageDetails_Response> createRepeated() => $pb.PbList<UpdateBusinessPageDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessPageDetails_Response>(create);
  static UpdateBusinessPageDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateBusinessPageDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateBusinessPageDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails._() : super();
  factory UpdateBusinessPageDetails() => create();
  factory UpdateBusinessPageDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails clone() => UpdateBusinessPageDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateBusinessPageDetails copyWith(void Function(UpdateBusinessPageDetails) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails create() => UpdateBusinessPageDetails._();
  UpdateBusinessPageDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessPageDetails> createRepeated() => $pb.PbList<UpdateBusinessPageDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPageDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateBusinessPageDetails>(create);
  static UpdateBusinessPageDetails _defaultInstance;
}

class UncreateBusinessPage_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateBusinessPage.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage_Request._() : super();
  factory UncreateBusinessPage_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UncreateBusinessPage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage_Request clone() => UncreateBusinessPage_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage_Request copyWith(void Function(UncreateBusinessPage_Request) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage_Request create() => UncreateBusinessPage_Request._();
  UncreateBusinessPage_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateBusinessPage_Request> createRepeated() => $pb.PbList<UncreateBusinessPage_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateBusinessPage_Request>(create);
  static UncreateBusinessPage_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateBusinessPage_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateBusinessPage.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage_Response._() : super();
  factory UncreateBusinessPage_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UncreateBusinessPage_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage_Response clone() => UncreateBusinessPage_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage_Response copyWith(void Function(UncreateBusinessPage_Response) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage_Response create() => UncreateBusinessPage_Response._();
  UncreateBusinessPage_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateBusinessPage_Response> createRepeated() => $pb.PbList<UncreateBusinessPage_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateBusinessPage_Response>(create);
  static UncreateBusinessPage_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateBusinessPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateBusinessPage', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage._() : super();
  factory UncreateBusinessPage() => create();
  factory UncreateBusinessPage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage clone() => UncreateBusinessPage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateBusinessPage copyWith(void Function(UncreateBusinessPage) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage create() => UncreateBusinessPage._();
  UncreateBusinessPage createEmptyInstance() => create();
  static $pb.PbList<UncreateBusinessPage> createRepeated() => $pb.PbList<UncreateBusinessPage>();
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateBusinessPage>(create);
  static UncreateBusinessPage _defaultInstance;
}

class FetchMyBusinessPageIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMyBusinessPageIds.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchMyBusinessPageIds_Request._() : super();
  factory FetchMyBusinessPageIds_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory FetchMyBusinessPageIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyBusinessPageIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds_Request clone() => FetchMyBusinessPageIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds_Request copyWith(void Function(FetchMyBusinessPageIds_Request) updates) => super.copyWith((message) => updates(message as FetchMyBusinessPageIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds_Request create() => FetchMyBusinessPageIds_Request._();
  FetchMyBusinessPageIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchMyBusinessPageIds_Request> createRepeated() => $pb.PbList<FetchMyBusinessPageIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyBusinessPageIds_Request>(create);
  static FetchMyBusinessPageIds_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchMyBusinessPageIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMyBusinessPageIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchMyBusinessPageIds_Response._() : super();
  factory FetchMyBusinessPageIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchMyBusinessPageIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyBusinessPageIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds_Response clone() => FetchMyBusinessPageIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds_Response copyWith(void Function(FetchMyBusinessPageIds_Response) updates) => super.copyWith((message) => updates(message as FetchMyBusinessPageIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds_Response create() => FetchMyBusinessPageIds_Response._();
  FetchMyBusinessPageIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchMyBusinessPageIds_Response> createRepeated() => $pb.PbList<FetchMyBusinessPageIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyBusinessPageIds_Response>(create);
  static FetchMyBusinessPageIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchMyBusinessPageIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMyBusinessPageIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchMyBusinessPageIds._() : super();
  factory FetchMyBusinessPageIds() => create();
  factory FetchMyBusinessPageIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyBusinessPageIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds clone() => FetchMyBusinessPageIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMyBusinessPageIds copyWith(void Function(FetchMyBusinessPageIds) updates) => super.copyWith((message) => updates(message as FetchMyBusinessPageIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds create() => FetchMyBusinessPageIds._();
  FetchMyBusinessPageIds createEmptyInstance() => create();
  static $pb.PbList<FetchMyBusinessPageIds> createRepeated() => $pb.PbList<FetchMyBusinessPageIds>();
  @$core.pragma('dart2js:noInline')
  static FetchMyBusinessPageIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyBusinessPageIds>(create);
  static FetchMyBusinessPageIds _defaultInstance;
}

class FetchBusinessPageDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails_Request._() : super();
  factory FetchBusinessPageDetails_Request({
    $core.String sessionKey,
    $core.int businessPageId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    return _result;
  }
  factory FetchBusinessPageDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails_Request clone() => FetchBusinessPageDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails_Request copyWith(void Function(FetchBusinessPageDetails_Request) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails_Request create() => FetchBusinessPageDetails_Request._();
  FetchBusinessPageDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageDetails_Request> createRepeated() => $pb.PbList<FetchBusinessPageDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageDetails_Request>(create);
  static FetchBusinessPageDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get businessPageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set businessPageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessPageId() => clearField(2);
}

class FetchBusinessPageDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails_Response._() : super();
  factory FetchBusinessPageDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String title,
    $core.String type,
    $core.List<$core.int> pictureBlob,
    $core.String role,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (type != null) {
      _result.type = type;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    if (role != null) {
      _result.role = role;
    }
    return _result;
  }
  factory FetchBusinessPageDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails_Response clone() => FetchBusinessPageDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails_Response copyWith(void Function(FetchBusinessPageDetails_Response) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails_Response create() => FetchBusinessPageDetails_Response._();
  FetchBusinessPageDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageDetails_Response> createRepeated() => $pb.PbList<FetchBusinessPageDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageDetails_Response>(create);
  static FetchBusinessPageDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get pictureBlob => $_getN(4);
  @$pb.TagNumber(5)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPictureBlob() => $_has(4);
  @$pb.TagNumber(5)
  void clearPictureBlob() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get role => $_getSZ(5);
  @$pb.TagNumber(6)
  set role($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);
}

class FetchBusinessPageDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails._() : super();
  factory FetchBusinessPageDetails() => create();
  factory FetchBusinessPageDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails clone() => FetchBusinessPageDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageDetails copyWith(void Function(FetchBusinessPageDetails) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails create() => FetchBusinessPageDetails._();
  FetchBusinessPageDetails createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageDetails> createRepeated() => $pb.PbList<FetchBusinessPageDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageDetails>(create);
  static FetchBusinessPageDetails _defaultInstance;
}

class CreateProduct_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateProduct.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryId', $pb.PbFieldType.O3, protoName: 'categoryId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeId', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OF)
    ..e<Currency>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency', $pb.PbFieldType.OE, defaultOrMaker: Currency.KRW, valueOf: Currency.valueOf, enumValues: Currency.values)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  CreateProduct_Request._() : super();
  factory CreateProduct_Request({
    $core.String sessionKey,
    $core.int businessPageId,
    $core.String name,
    $core.int categoryId,
    $core.int typeId,
    $core.List<$core.int> pictureBlob,
    $core.double price,
    Currency currency,
    $core.String description,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (categoryId != null) {
      _result.categoryId = categoryId;
    }
    if (typeId != null) {
      _result.typeId = typeId;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    if (price != null) {
      _result.price = price;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory CreateProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateProduct_Request clone() => CreateProduct_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateProduct_Request copyWith(void Function(CreateProduct_Request) updates) => super.copyWith((message) => updates(message as CreateProduct_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateProduct_Request create() => CreateProduct_Request._();
  CreateProduct_Request createEmptyInstance() => create();
  static $pb.PbList<CreateProduct_Request> createRepeated() => $pb.PbList<CreateProduct_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateProduct_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateProduct_Request>(create);
  static CreateProduct_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get businessPageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set businessPageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessPageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get categoryId => $_getIZ(3);
  @$pb.TagNumber(4)
  set categoryId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategoryId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategoryId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get typeId => $_getIZ(4);
  @$pb.TagNumber(5)
  set typeId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTypeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTypeId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get pictureBlob => $_getN(5);
  @$pb.TagNumber(6)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPictureBlob() => $_has(5);
  @$pb.TagNumber(6)
  void clearPictureBlob() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get price => $_getN(6);
  @$pb.TagNumber(7)
  set price($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearPrice() => clearField(7);

  @$pb.TagNumber(8)
  Currency get currency => $_getN(7);
  @$pb.TagNumber(8)
  set currency(Currency v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasCurrency() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrency() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get description => $_getSZ(8);
  @$pb.TagNumber(9)
  set description($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearDescription() => clearField(9);
}

class CreateProduct_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateProduct.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CreateProduct_Response._() : super();
  factory CreateProduct_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CreateProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateProduct_Response clone() => CreateProduct_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateProduct_Response copyWith(void Function(CreateProduct_Response) updates) => super.copyWith((message) => updates(message as CreateProduct_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateProduct_Response create() => CreateProduct_Response._();
  CreateProduct_Response createEmptyInstance() => create();
  static $pb.PbList<CreateProduct_Response> createRepeated() => $pb.PbList<CreateProduct_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateProduct_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateProduct_Response>(create);
  static CreateProduct_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateProduct._() : super();
  factory CreateProduct() => create();
  factory CreateProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateProduct clone() => CreateProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateProduct copyWith(void Function(CreateProduct) updates) => super.copyWith((message) => updates(message as CreateProduct)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateProduct create() => CreateProduct._();
  CreateProduct createEmptyInstance() => create();
  static $pb.PbList<CreateProduct> createRepeated() => $pb.PbList<CreateProduct>();
  @$core.pragma('dart2js:noInline')
  static CreateProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateProduct>(create);
  static CreateProduct _defaultInstance;
}

class UpdateProductDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateProductDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateProductDetails_Request._() : super();
  factory UpdateProductDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UpdateProductDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProductDetails_Request clone() => UpdateProductDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProductDetails_Request copyWith(void Function(UpdateProductDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateProductDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails_Request create() => UpdateProductDetails_Request._();
  UpdateProductDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateProductDetails_Request> createRepeated() => $pb.PbList<UpdateProductDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProductDetails_Request>(create);
  static UpdateProductDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateProductDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateProductDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateProductDetails_Response._() : super();
  factory UpdateProductDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateProductDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProductDetails_Response clone() => UpdateProductDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProductDetails_Response copyWith(void Function(UpdateProductDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateProductDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails_Response create() => UpdateProductDetails_Response._();
  UpdateProductDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateProductDetails_Response> createRepeated() => $pb.PbList<UpdateProductDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProductDetails_Response>(create);
  static UpdateProductDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateProductDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateProductDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateProductDetails._() : super();
  factory UpdateProductDetails() => create();
  factory UpdateProductDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProductDetails clone() => UpdateProductDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProductDetails copyWith(void Function(UpdateProductDetails) updates) => super.copyWith((message) => updates(message as UpdateProductDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails create() => UpdateProductDetails._();
  UpdateProductDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateProductDetails> createRepeated() => $pb.PbList<UpdateProductDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProductDetails>(create);
  static UpdateProductDetails _defaultInstance;
}

class UncreateProduct_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateProduct.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateProduct_Request._() : super();
  factory UncreateProduct_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UncreateProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateProduct_Request clone() => UncreateProduct_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateProduct_Request copyWith(void Function(UncreateProduct_Request) updates) => super.copyWith((message) => updates(message as UncreateProduct_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateProduct_Request create() => UncreateProduct_Request._();
  UncreateProduct_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateProduct_Request> createRepeated() => $pb.PbList<UncreateProduct_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateProduct_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateProduct_Request>(create);
  static UncreateProduct_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateProduct_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateProduct.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UncreateProduct_Response._() : super();
  factory UncreateProduct_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UncreateProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateProduct_Response clone() => UncreateProduct_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateProduct_Response copyWith(void Function(UncreateProduct_Response) updates) => super.copyWith((message) => updates(message as UncreateProduct_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateProduct_Response create() => UncreateProduct_Response._();
  UncreateProduct_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateProduct_Response> createRepeated() => $pb.PbList<UncreateProduct_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateProduct_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateProduct_Response>(create);
  static UncreateProduct_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateProduct._() : super();
  factory UncreateProduct() => create();
  factory UncreateProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateProduct clone() => UncreateProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateProduct copyWith(void Function(UncreateProduct) updates) => super.copyWith((message) => updates(message as UncreateProduct)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateProduct create() => UncreateProduct._();
  UncreateProduct createEmptyInstance() => create();
  static $pb.PbList<UncreateProduct> createRepeated() => $pb.PbList<UncreateProduct>();
  @$core.pragma('dart2js:noInline')
  static UncreateProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateProduct>(create);
  static UncreateProduct _defaultInstance;
}

class FetchNextKProductIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKProductIds.Request', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'k', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousProductId', $pb.PbFieldType.O3, protoName: 'previousProductId')
    ..aOM<FilterDetails>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterDetails', protoName: 'filterDetails', subBuilder: FilterDetails.create)
    ..hasRequiredFields = false
  ;

  FetchNextKProductIds_Request._() : super();
  factory FetchNextKProductIds_Request({
    $core.int k,
    $core.int previousProductId,
    FilterDetails filterDetails,
  }) {
    final _result = create();
    if (k != null) {
      _result.k = k;
    }
    if (previousProductId != null) {
      _result.previousProductId = previousProductId;
    }
    if (filterDetails != null) {
      _result.filterDetails = filterDetails;
    }
    return _result;
  }
  factory FetchNextKProductIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKProductIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds_Request clone() => FetchNextKProductIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds_Request copyWith(void Function(FetchNextKProductIds_Request) updates) => super.copyWith((message) => updates(message as FetchNextKProductIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds_Request create() => FetchNextKProductIds_Request._();
  FetchNextKProductIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchNextKProductIds_Request> createRepeated() => $pb.PbList<FetchNextKProductIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKProductIds_Request>(create);
  static FetchNextKProductIds_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get k => $_getIZ(0);
  @$pb.TagNumber(1)
  set k($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasK() => $_has(0);
  @$pb.TagNumber(1)
  void clearK() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get previousProductId => $_getIZ(1);
  @$pb.TagNumber(2)
  set previousProductId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreviousProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreviousProductId() => clearField(2);

  @$pb.TagNumber(3)
  FilterDetails get filterDetails => $_getN(2);
  @$pb.TagNumber(3)
  set filterDetails(FilterDetails v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilterDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilterDetails() => clearField(3);
  @$pb.TagNumber(3)
  FilterDetails ensureFilterDetails() => $_ensure(2);
}

class FetchNextKProductIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKProductIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchNextKProductIds_Response._() : super();
  factory FetchNextKProductIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchNextKProductIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKProductIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds_Response clone() => FetchNextKProductIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds_Response copyWith(void Function(FetchNextKProductIds_Response) updates) => super.copyWith((message) => updates(message as FetchNextKProductIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds_Response create() => FetchNextKProductIds_Response._();
  FetchNextKProductIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchNextKProductIds_Response> createRepeated() => $pb.PbList<FetchNextKProductIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKProductIds_Response>(create);
  static FetchNextKProductIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchNextKProductIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKProductIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchNextKProductIds._() : super();
  factory FetchNextKProductIds() => create();
  factory FetchNextKProductIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKProductIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds clone() => FetchNextKProductIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKProductIds copyWith(void Function(FetchNextKProductIds) updates) => super.copyWith((message) => updates(message as FetchNextKProductIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds create() => FetchNextKProductIds._();
  FetchNextKProductIds createEmptyInstance() => create();
  static $pb.PbList<FetchNextKProductIds> createRepeated() => $pb.PbList<FetchNextKProductIds>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKProductIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKProductIds>(create);
  static FetchNextKProductIds _defaultInstance;
}

class FetchProductDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductDetails.Request', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'productId', $pb.PbFieldType.O3, protoName: 'productId')
    ..hasRequiredFields = false
  ;

  FetchProductDetails_Request._() : super();
  factory FetchProductDetails_Request({
    $core.int productId,
  }) {
    final _result = create();
    if (productId != null) {
      _result.productId = productId;
    }
    return _result;
  }
  factory FetchProductDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductDetails_Request clone() => FetchProductDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductDetails_Request copyWith(void Function(FetchProductDetails_Request) updates) => super.copyWith((message) => updates(message as FetchProductDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Request create() => FetchProductDetails_Request._();
  FetchProductDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductDetails_Request> createRepeated() => $pb.PbList<FetchProductDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductDetails_Request>(create);
  static FetchProductDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get productId => $_getIZ(0);
  @$pb.TagNumber(1)
  set productId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);
}

class FetchProductDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryId', $pb.PbFieldType.O3, protoName: 'categoryId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeId', $pb.PbFieldType.O3, protoName: 'typeId')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'published')
    ..a<$core.List<$core.int>>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OF)
    ..e<Currency>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currency', $pb.PbFieldType.OE, defaultOrMaker: Currency.KRW, valueOf: Currency.valueOf, enumValues: Currency.values)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  FetchProductDetails_Response._() : super();
  factory FetchProductDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String name,
    $core.int categoryId,
    $core.int typeId,
    $core.bool published,
    $core.List<$core.int> pictureBlob,
    $core.int businessPageId,
    $core.double price,
    Currency currency,
    $core.String description,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (categoryId != null) {
      _result.categoryId = categoryId;
    }
    if (typeId != null) {
      _result.typeId = typeId;
    }
    if (published != null) {
      _result.published = published;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (currency != null) {
      _result.currency = currency;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory FetchProductDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductDetails_Response clone() => FetchProductDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductDetails_Response copyWith(void Function(FetchProductDetails_Response) updates) => super.copyWith((message) => updates(message as FetchProductDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Response create() => FetchProductDetails_Response._();
  FetchProductDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProductDetails_Response> createRepeated() => $pb.PbList<FetchProductDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductDetails_Response>(create);
  static FetchProductDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get categoryId => $_getIZ(3);
  @$pb.TagNumber(4)
  set categoryId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategoryId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategoryId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get typeId => $_getIZ(4);
  @$pb.TagNumber(5)
  set typeId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTypeId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTypeId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get published => $_getBF(5);
  @$pb.TagNumber(6)
  set published($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPublished() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublished() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get pictureBlob => $_getN(6);
  @$pb.TagNumber(7)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPictureBlob() => $_has(6);
  @$pb.TagNumber(7)
  void clearPictureBlob() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get businessPageId => $_getIZ(7);
  @$pb.TagNumber(8)
  set businessPageId($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBusinessPageId() => $_has(7);
  @$pb.TagNumber(8)
  void clearBusinessPageId() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get price => $_getN(8);
  @$pb.TagNumber(9)
  set price($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPrice() => clearField(9);

  @$pb.TagNumber(10)
  Currency get currency => $_getN(9);
  @$pb.TagNumber(10)
  set currency(Currency v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCurrency() => $_has(9);
  @$pb.TagNumber(10)
  void clearCurrency() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(11)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => clearField(11);
}

class FetchProductDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductDetails._() : super();
  factory FetchProductDetails() => create();
  factory FetchProductDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductDetails clone() => FetchProductDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductDetails copyWith(void Function(FetchProductDetails) updates) => super.copyWith((message) => updates(message as FetchProductDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails create() => FetchProductDetails._();
  FetchProductDetails createEmptyInstance() => create();
  static $pb.PbList<FetchProductDetails> createRepeated() => $pb.PbList<FetchProductDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductDetails>(create);
  static FetchProductDetails _defaultInstance;
}

class PublishProduct_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublishProduct.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  PublishProduct_Request._() : super();
  factory PublishProduct_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory PublishProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishProduct_Request clone() => PublishProduct_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishProduct_Request copyWith(void Function(PublishProduct_Request) updates) => super.copyWith((message) => updates(message as PublishProduct_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublishProduct_Request create() => PublishProduct_Request._();
  PublishProduct_Request createEmptyInstance() => create();
  static $pb.PbList<PublishProduct_Request> createRepeated() => $pb.PbList<PublishProduct_Request>();
  @$core.pragma('dart2js:noInline')
  static PublishProduct_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishProduct_Request>(create);
  static PublishProduct_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class PublishProduct_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublishProduct.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  PublishProduct_Response._() : super();
  factory PublishProduct_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory PublishProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishProduct_Response clone() => PublishProduct_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishProduct_Response copyWith(void Function(PublishProduct_Response) updates) => super.copyWith((message) => updates(message as PublishProduct_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublishProduct_Response create() => PublishProduct_Response._();
  PublishProduct_Response createEmptyInstance() => create();
  static $pb.PbList<PublishProduct_Response> createRepeated() => $pb.PbList<PublishProduct_Response>();
  @$core.pragma('dart2js:noInline')
  static PublishProduct_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishProduct_Response>(create);
  static PublishProduct_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class PublishProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublishProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PublishProduct._() : super();
  factory PublishProduct() => create();
  factory PublishProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishProduct clone() => PublishProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishProduct copyWith(void Function(PublishProduct) updates) => super.copyWith((message) => updates(message as PublishProduct)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublishProduct create() => PublishProduct._();
  PublishProduct createEmptyInstance() => create();
  static $pb.PbList<PublishProduct> createRepeated() => $pb.PbList<PublishProduct>();
  @$core.pragma('dart2js:noInline')
  static PublishProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishProduct>(create);
  static PublishProduct _defaultInstance;
}

class UnpublishProduct_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnpublishProduct.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UnpublishProduct_Request._() : super();
  factory UnpublishProduct_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UnpublishProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnpublishProduct_Request clone() => UnpublishProduct_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnpublishProduct_Request copyWith(void Function(UnpublishProduct_Request) updates) => super.copyWith((message) => updates(message as UnpublishProduct_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct_Request create() => UnpublishProduct_Request._();
  UnpublishProduct_Request createEmptyInstance() => create();
  static $pb.PbList<UnpublishProduct_Request> createRepeated() => $pb.PbList<UnpublishProduct_Request>();
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnpublishProduct_Request>(create);
  static UnpublishProduct_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UnpublishProduct_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnpublishProduct.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UnpublishProduct_Response._() : super();
  factory UnpublishProduct_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UnpublishProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnpublishProduct_Response clone() => UnpublishProduct_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnpublishProduct_Response copyWith(void Function(UnpublishProduct_Response) updates) => super.copyWith((message) => updates(message as UnpublishProduct_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct_Response create() => UnpublishProduct_Response._();
  UnpublishProduct_Response createEmptyInstance() => create();
  static $pb.PbList<UnpublishProduct_Response> createRepeated() => $pb.PbList<UnpublishProduct_Response>();
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnpublishProduct_Response>(create);
  static UnpublishProduct_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UnpublishProduct extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UnpublishProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UnpublishProduct._() : super();
  factory UnpublishProduct() => create();
  factory UnpublishProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnpublishProduct clone() => UnpublishProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnpublishProduct copyWith(void Function(UnpublishProduct) updates) => super.copyWith((message) => updates(message as UnpublishProduct)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct create() => UnpublishProduct._();
  UnpublishProduct createEmptyInstance() => create();
  static $pb.PbList<UnpublishProduct> createRepeated() => $pb.PbList<UnpublishProduct>();
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnpublishProduct>(create);
  static UnpublishProduct _defaultInstance;
}

class FetchProductTypeIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeIds.Request', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductTypeIds_Request._() : super();
  factory FetchProductTypeIds_Request() => create();
  factory FetchProductTypeIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds_Request clone() => FetchProductTypeIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds_Request copyWith(void Function(FetchProductTypeIds_Request) updates) => super.copyWith((message) => updates(message as FetchProductTypeIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds_Request create() => FetchProductTypeIds_Request._();
  FetchProductTypeIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeIds_Request> createRepeated() => $pb.PbList<FetchProductTypeIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeIds_Request>(create);
  static FetchProductTypeIds_Request _defaultInstance;
}

class FetchProductTypeIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchProductTypeIds_Response._() : super();
  factory FetchProductTypeIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchProductTypeIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds_Response clone() => FetchProductTypeIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds_Response copyWith(void Function(FetchProductTypeIds_Response) updates) => super.copyWith((message) => updates(message as FetchProductTypeIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds_Response create() => FetchProductTypeIds_Response._();
  FetchProductTypeIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeIds_Response> createRepeated() => $pb.PbList<FetchProductTypeIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeIds_Response>(create);
  static FetchProductTypeIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchProductTypeIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductTypeIds._() : super();
  factory FetchProductTypeIds() => create();
  factory FetchProductTypeIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds clone() => FetchProductTypeIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeIds copyWith(void Function(FetchProductTypeIds) updates) => super.copyWith((message) => updates(message as FetchProductTypeIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds create() => FetchProductTypeIds._();
  FetchProductTypeIds createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeIds> createRepeated() => $pb.PbList<FetchProductTypeIds>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeIds>(create);
  static FetchProductTypeIds _defaultInstance;
}

class FetchProductTypeDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeDetails.Request', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeId', $pb.PbFieldType.O3, protoName: 'typeId')
    ..hasRequiredFields = false
  ;

  FetchProductTypeDetails_Request._() : super();
  factory FetchProductTypeDetails_Request({
    $core.int typeId,
  }) {
    final _result = create();
    if (typeId != null) {
      _result.typeId = typeId;
    }
    return _result;
  }
  factory FetchProductTypeDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails_Request clone() => FetchProductTypeDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails_Request copyWith(void Function(FetchProductTypeDetails_Request) updates) => super.copyWith((message) => updates(message as FetchProductTypeDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails_Request create() => FetchProductTypeDetails_Request._();
  FetchProductTypeDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeDetails_Request> createRepeated() => $pb.PbList<FetchProductTypeDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeDetails_Request>(create);
  static FetchProductTypeDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get typeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set typeId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeId() => clearField(1);
}

class FetchProductTypeDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  FetchProductTypeDetails_Response._() : super();
  factory FetchProductTypeDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String name,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory FetchProductTypeDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails_Response clone() => FetchProductTypeDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails_Response copyWith(void Function(FetchProductTypeDetails_Response) updates) => super.copyWith((message) => updates(message as FetchProductTypeDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails_Response create() => FetchProductTypeDetails_Response._();
  FetchProductTypeDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeDetails_Response> createRepeated() => $pb.PbList<FetchProductTypeDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeDetails_Response>(create);
  static FetchProductTypeDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class FetchProductTypeDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductTypeDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductTypeDetails._() : super();
  factory FetchProductTypeDetails() => create();
  factory FetchProductTypeDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductTypeDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails clone() => FetchProductTypeDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductTypeDetails copyWith(void Function(FetchProductTypeDetails) updates) => super.copyWith((message) => updates(message as FetchProductTypeDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails create() => FetchProductTypeDetails._();
  FetchProductTypeDetails createEmptyInstance() => create();
  static $pb.PbList<FetchProductTypeDetails> createRepeated() => $pb.PbList<FetchProductTypeDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchProductTypeDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductTypeDetails>(create);
  static FetchProductTypeDetails _defaultInstance;
}

class FetchProductCategoryIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryIds.Request', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductCategoryIds_Request._() : super();
  factory FetchProductCategoryIds_Request() => create();
  factory FetchProductCategoryIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds_Request clone() => FetchProductCategoryIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds_Request copyWith(void Function(FetchProductCategoryIds_Request) updates) => super.copyWith((message) => updates(message as FetchProductCategoryIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds_Request create() => FetchProductCategoryIds_Request._();
  FetchProductCategoryIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryIds_Request> createRepeated() => $pb.PbList<FetchProductCategoryIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryIds_Request>(create);
  static FetchProductCategoryIds_Request _defaultInstance;
}

class FetchProductCategoryIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchProductCategoryIds_Response._() : super();
  factory FetchProductCategoryIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchProductCategoryIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds_Response clone() => FetchProductCategoryIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds_Response copyWith(void Function(FetchProductCategoryIds_Response) updates) => super.copyWith((message) => updates(message as FetchProductCategoryIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds_Response create() => FetchProductCategoryIds_Response._();
  FetchProductCategoryIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryIds_Response> createRepeated() => $pb.PbList<FetchProductCategoryIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryIds_Response>(create);
  static FetchProductCategoryIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchProductCategoryIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductCategoryIds._() : super();
  factory FetchProductCategoryIds() => create();
  factory FetchProductCategoryIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds clone() => FetchProductCategoryIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryIds copyWith(void Function(FetchProductCategoryIds) updates) => super.copyWith((message) => updates(message as FetchProductCategoryIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds create() => FetchProductCategoryIds._();
  FetchProductCategoryIds createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryIds> createRepeated() => $pb.PbList<FetchProductCategoryIds>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryIds>(create);
  static FetchProductCategoryIds _defaultInstance;
}

class FetchProductCategoryDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryDetails.Request', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'categoryId', $pb.PbFieldType.O3, protoName: 'categoryId')
    ..hasRequiredFields = false
  ;

  FetchProductCategoryDetails_Request._() : super();
  factory FetchProductCategoryDetails_Request({
    $core.int categoryId,
  }) {
    final _result = create();
    if (categoryId != null) {
      _result.categoryId = categoryId;
    }
    return _result;
  }
  factory FetchProductCategoryDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails_Request clone() => FetchProductCategoryDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails_Request copyWith(void Function(FetchProductCategoryDetails_Request) updates) => super.copyWith((message) => updates(message as FetchProductCategoryDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails_Request create() => FetchProductCategoryDetails_Request._();
  FetchProductCategoryDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryDetails_Request> createRepeated() => $pb.PbList<FetchProductCategoryDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryDetails_Request>(create);
  static FetchProductCategoryDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get categoryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set categoryId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCategoryId() => clearField(1);
}

class FetchProductCategoryDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..pPS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'examples')
    ..hasRequiredFields = false
  ;

  FetchProductCategoryDetails_Response._() : super();
  factory FetchProductCategoryDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String name,
    $core.List<$core.int> pictureBlob,
    $core.Iterable<$core.String> examples,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (pictureBlob != null) {
      _result.pictureBlob = pictureBlob;
    }
    if (examples != null) {
      _result.examples.addAll(examples);
    }
    return _result;
  }
  factory FetchProductCategoryDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails_Response clone() => FetchProductCategoryDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails_Response copyWith(void Function(FetchProductCategoryDetails_Response) updates) => super.copyWith((message) => updates(message as FetchProductCategoryDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails_Response create() => FetchProductCategoryDetails_Response._();
  FetchProductCategoryDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryDetails_Response> createRepeated() => $pb.PbList<FetchProductCategoryDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryDetails_Response>(create);
  static FetchProductCategoryDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get pictureBlob => $_getN(3);
  @$pb.TagNumber(4)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPictureBlob() => $_has(3);
  @$pb.TagNumber(4)
  void clearPictureBlob() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get examples => $_getList(4);
}

class FetchProductCategoryDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchProductCategoryDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductCategoryDetails._() : super();
  factory FetchProductCategoryDetails() => create();
  factory FetchProductCategoryDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductCategoryDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails clone() => FetchProductCategoryDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchProductCategoryDetails copyWith(void Function(FetchProductCategoryDetails) updates) => super.copyWith((message) => updates(message as FetchProductCategoryDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails create() => FetchProductCategoryDetails._();
  FetchProductCategoryDetails createEmptyInstance() => create();
  static $pb.PbList<FetchProductCategoryDetails> createRepeated() => $pb.PbList<FetchProductCategoryDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchProductCategoryDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductCategoryDetails>(create);
  static FetchProductCategoryDetails _defaultInstance;
}

class CreateVacantJob_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVacantJob.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  CreateVacantJob_Request._() : super();
  factory CreateVacantJob_Request({
    $core.String sessionKey,
    $core.int businessPageId,
    $core.String title,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory CreateVacantJob_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacantJob_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateVacantJob_Request clone() => CreateVacantJob_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateVacantJob_Request copyWith(void Function(CreateVacantJob_Request) updates) => super.copyWith((message) => updates(message as CreateVacantJob_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob_Request create() => CreateVacantJob_Request._();
  CreateVacantJob_Request createEmptyInstance() => create();
  static $pb.PbList<CreateVacantJob_Request> createRepeated() => $pb.PbList<CreateVacantJob_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacantJob_Request>(create);
  static CreateVacantJob_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get businessPageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set businessPageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessPageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);
}

class CreateVacantJob_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVacantJob.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CreateVacantJob_Response._() : super();
  factory CreateVacantJob_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CreateVacantJob_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacantJob_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateVacantJob_Response clone() => CreateVacantJob_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateVacantJob_Response copyWith(void Function(CreateVacantJob_Response) updates) => super.copyWith((message) => updates(message as CreateVacantJob_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob_Response create() => CreateVacantJob_Response._();
  CreateVacantJob_Response createEmptyInstance() => create();
  static $pb.PbList<CreateVacantJob_Response> createRepeated() => $pb.PbList<CreateVacantJob_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacantJob_Response>(create);
  static CreateVacantJob_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateVacantJob extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateVacantJob', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateVacantJob._() : super();
  factory CreateVacantJob() => create();
  factory CreateVacantJob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacantJob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateVacantJob clone() => CreateVacantJob()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateVacantJob copyWith(void Function(CreateVacantJob) updates) => super.copyWith((message) => updates(message as CreateVacantJob)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob create() => CreateVacantJob._();
  CreateVacantJob createEmptyInstance() => create();
  static $pb.PbList<CreateVacantJob> createRepeated() => $pb.PbList<CreateVacantJob>();
  @$core.pragma('dart2js:noInline')
  static CreateVacantJob getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacantJob>(create);
  static CreateVacantJob _defaultInstance;
}

class UpdateJobDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateJobDetails_Request._() : super();
  factory UpdateJobDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UpdateJobDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobDetails_Request clone() => UpdateJobDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobDetails_Request copyWith(void Function(UpdateJobDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateJobDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails_Request create() => UpdateJobDetails_Request._();
  UpdateJobDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateJobDetails_Request> createRepeated() => $pb.PbList<UpdateJobDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobDetails_Request>(create);
  static UpdateJobDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateJobDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateJobDetails_Response._() : super();
  factory UpdateJobDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateJobDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobDetails_Response clone() => UpdateJobDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobDetails_Response copyWith(void Function(UpdateJobDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateJobDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails_Response create() => UpdateJobDetails_Response._();
  UpdateJobDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateJobDetails_Response> createRepeated() => $pb.PbList<UpdateJobDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobDetails_Response>(create);
  static UpdateJobDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateJobDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateJobDetails._() : super();
  factory UpdateJobDetails() => create();
  factory UpdateJobDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobDetails clone() => UpdateJobDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobDetails copyWith(void Function(UpdateJobDetails) updates) => super.copyWith((message) => updates(message as UpdateJobDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails create() => UpdateJobDetails._();
  UpdateJobDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateJobDetails> createRepeated() => $pb.PbList<UpdateJobDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobDetails>(create);
  static UpdateJobDetails _defaultInstance;
}

class UncreateJob_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJob.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateJob_Request._() : super();
  factory UncreateJob_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UncreateJob_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJob_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJob_Request clone() => UncreateJob_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJob_Request copyWith(void Function(UncreateJob_Request) updates) => super.copyWith((message) => updates(message as UncreateJob_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJob_Request create() => UncreateJob_Request._();
  UncreateJob_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateJob_Request> createRepeated() => $pb.PbList<UncreateJob_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateJob_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJob_Request>(create);
  static UncreateJob_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateJob_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJob.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UncreateJob_Response._() : super();
  factory UncreateJob_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UncreateJob_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJob_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJob_Response clone() => UncreateJob_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJob_Response copyWith(void Function(UncreateJob_Response) updates) => super.copyWith((message) => updates(message as UncreateJob_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJob_Response create() => UncreateJob_Response._();
  UncreateJob_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateJob_Response> createRepeated() => $pb.PbList<UncreateJob_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateJob_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJob_Response>(create);
  static UncreateJob_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateJob extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJob', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateJob._() : super();
  factory UncreateJob() => create();
  factory UncreateJob.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJob.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJob clone() => UncreateJob()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJob copyWith(void Function(UncreateJob) updates) => super.copyWith((message) => updates(message as UncreateJob)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJob create() => UncreateJob._();
  UncreateJob createEmptyInstance() => create();
  static $pb.PbList<UncreateJob> createRepeated() => $pb.PbList<UncreateJob>();
  @$core.pragma('dart2js:noInline')
  static UncreateJob getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJob>(create);
  static UncreateJob _defaultInstance;
}

class FetchBusinessPageJobIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageJobIds.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..hasRequiredFields = false
  ;

  FetchBusinessPageJobIds_Request._() : super();
  factory FetchBusinessPageJobIds_Request({
    $core.String sessionKey,
    $core.int businessPageId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (businessPageId != null) {
      _result.businessPageId = businessPageId;
    }
    return _result;
  }
  factory FetchBusinessPageJobIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageJobIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds_Request clone() => FetchBusinessPageJobIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds_Request copyWith(void Function(FetchBusinessPageJobIds_Request) updates) => super.copyWith((message) => updates(message as FetchBusinessPageJobIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds_Request create() => FetchBusinessPageJobIds_Request._();
  FetchBusinessPageJobIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageJobIds_Request> createRepeated() => $pb.PbList<FetchBusinessPageJobIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageJobIds_Request>(create);
  static FetchBusinessPageJobIds_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get businessPageId => $_getIZ(1);
  @$pb.TagNumber(2)
  set businessPageId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessPageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessPageId() => clearField(2);
}

class FetchBusinessPageJobIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageJobIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchBusinessPageJobIds_Response._() : super();
  factory FetchBusinessPageJobIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchBusinessPageJobIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageJobIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds_Response clone() => FetchBusinessPageJobIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds_Response copyWith(void Function(FetchBusinessPageJobIds_Response) updates) => super.copyWith((message) => updates(message as FetchBusinessPageJobIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds_Response create() => FetchBusinessPageJobIds_Response._();
  FetchBusinessPageJobIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageJobIds_Response> createRepeated() => $pb.PbList<FetchBusinessPageJobIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageJobIds_Response>(create);
  static FetchBusinessPageJobIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchBusinessPageJobIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchBusinessPageJobIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchBusinessPageJobIds._() : super();
  factory FetchBusinessPageJobIds() => create();
  factory FetchBusinessPageJobIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageJobIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds clone() => FetchBusinessPageJobIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchBusinessPageJobIds copyWith(void Function(FetchBusinessPageJobIds) updates) => super.copyWith((message) => updates(message as FetchBusinessPageJobIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds create() => FetchBusinessPageJobIds._();
  FetchBusinessPageJobIds createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPageJobIds> createRepeated() => $pb.PbList<FetchBusinessPageJobIds>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPageJobIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPageJobIds>(create);
  static FetchBusinessPageJobIds _defaultInstance;
}

class FetchNextKVacantJobIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKVacantJobIds.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'k', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'previousVacantJobId', $pb.PbFieldType.O3, protoName: 'previousVacantJobId')
    ..aOM<FilterDetails>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filterDetails', protoName: 'filterDetails', subBuilder: FilterDetails.create)
    ..hasRequiredFields = false
  ;

  FetchNextKVacantJobIds_Request._() : super();
  factory FetchNextKVacantJobIds_Request({
    $core.String sessionKey,
    $core.int k,
    $core.int previousVacantJobId,
    FilterDetails filterDetails,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (k != null) {
      _result.k = k;
    }
    if (previousVacantJobId != null) {
      _result.previousVacantJobId = previousVacantJobId;
    }
    if (filterDetails != null) {
      _result.filterDetails = filterDetails;
    }
    return _result;
  }
  factory FetchNextKVacantJobIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKVacantJobIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds_Request clone() => FetchNextKVacantJobIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds_Request copyWith(void Function(FetchNextKVacantJobIds_Request) updates) => super.copyWith((message) => updates(message as FetchNextKVacantJobIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds_Request create() => FetchNextKVacantJobIds_Request._();
  FetchNextKVacantJobIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchNextKVacantJobIds_Request> createRepeated() => $pb.PbList<FetchNextKVacantJobIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKVacantJobIds_Request>(create);
  static FetchNextKVacantJobIds_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get k => $_getIZ(1);
  @$pb.TagNumber(2)
  set k($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasK() => $_has(1);
  @$pb.TagNumber(2)
  void clearK() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get previousVacantJobId => $_getIZ(2);
  @$pb.TagNumber(3)
  set previousVacantJobId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPreviousVacantJobId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousVacantJobId() => clearField(3);

  @$pb.TagNumber(4)
  FilterDetails get filterDetails => $_getN(3);
  @$pb.TagNumber(4)
  set filterDetails(FilterDetails v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilterDetails() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilterDetails() => clearField(4);
  @$pb.TagNumber(4)
  FilterDetails ensureFilterDetails() => $_ensure(3);
}

class FetchNextKVacantJobIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKVacantJobIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchNextKVacantJobIds_Response._() : super();
  factory FetchNextKVacantJobIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchNextKVacantJobIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKVacantJobIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds_Response clone() => FetchNextKVacantJobIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds_Response copyWith(void Function(FetchNextKVacantJobIds_Response) updates) => super.copyWith((message) => updates(message as FetchNextKVacantJobIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds_Response create() => FetchNextKVacantJobIds_Response._();
  FetchNextKVacantJobIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchNextKVacantJobIds_Response> createRepeated() => $pb.PbList<FetchNextKVacantJobIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKVacantJobIds_Response>(create);
  static FetchNextKVacantJobIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchNextKVacantJobIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchNextKVacantJobIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchNextKVacantJobIds._() : super();
  factory FetchNextKVacantJobIds() => create();
  factory FetchNextKVacantJobIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchNextKVacantJobIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds clone() => FetchNextKVacantJobIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchNextKVacantJobIds copyWith(void Function(FetchNextKVacantJobIds) updates) => super.copyWith((message) => updates(message as FetchNextKVacantJobIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds create() => FetchNextKVacantJobIds._();
  FetchNextKVacantJobIds createEmptyInstance() => create();
  static $pb.PbList<FetchNextKVacantJobIds> createRepeated() => $pb.PbList<FetchNextKVacantJobIds>();
  @$core.pragma('dart2js:noInline')
  static FetchNextKVacantJobIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchNextKVacantJobIds>(create);
  static FetchNextKVacantJobIds _defaultInstance;
}

class FetchJobDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobId', $pb.PbFieldType.O3, protoName: 'jobId')
    ..hasRequiredFields = false
  ;

  FetchJobDetails_Request._() : super();
  factory FetchJobDetails_Request({
    $core.String sessionKey,
    $core.int jobId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobId != null) {
      _result.jobId = jobId;
    }
    return _result;
  }
  factory FetchJobDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobDetails_Request clone() => FetchJobDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobDetails_Request copyWith(void Function(FetchJobDetails_Request) updates) => super.copyWith((message) => updates(message as FetchJobDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails_Request create() => FetchJobDetails_Request._();
  FetchJobDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchJobDetails_Request> createRepeated() => $pb.PbList<FetchJobDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobDetails_Request>(create);
  static FetchJobDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobId() => clearField(2);
}

class FetchJobDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hiredUserId', $pb.PbFieldType.O3, protoName: 'hiredUserId')
    ..hasRequiredFields = false
  ;

  FetchJobDetails_Response._() : super();
  factory FetchJobDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String role,
    $core.String title,
    $core.int hiredUserId,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (role != null) {
      _result.role = role;
    }
    if (title != null) {
      _result.title = title;
    }
    if (hiredUserId != null) {
      _result.hiredUserId = hiredUserId;
    }
    return _result;
  }
  factory FetchJobDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobDetails_Response clone() => FetchJobDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobDetails_Response copyWith(void Function(FetchJobDetails_Response) updates) => super.copyWith((message) => updates(message as FetchJobDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails_Response create() => FetchJobDetails_Response._();
  FetchJobDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchJobDetails_Response> createRepeated() => $pb.PbList<FetchJobDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobDetails_Response>(create);
  static FetchJobDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get role => $_getSZ(2);
  @$pb.TagNumber(3)
  set role($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get hiredUserId => $_getIZ(4);
  @$pb.TagNumber(5)
  set hiredUserId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHiredUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearHiredUserId() => clearField(5);
}

class FetchJobDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchJobDetails._() : super();
  factory FetchJobDetails() => create();
  factory FetchJobDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobDetails clone() => FetchJobDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobDetails copyWith(void Function(FetchJobDetails) updates) => super.copyWith((message) => updates(message as FetchJobDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails create() => FetchJobDetails._();
  FetchJobDetails createEmptyInstance() => create();
  static $pb.PbList<FetchJobDetails> createRepeated() => $pb.PbList<FetchJobDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchJobDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobDetails>(create);
  static FetchJobDetails _defaultInstance;
}

class CreateJobApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateJobApplication.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobId', $pb.PbFieldType.O3, protoName: 'jobId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  CreateJobApplication_Request._() : super();
  factory CreateJobApplication_Request({
    $core.String sessionKey,
    $core.int jobId,
    $core.String message,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobId != null) {
      _result.jobId = jobId;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory CreateJobApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateJobApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateJobApplication_Request clone() => CreateJobApplication_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateJobApplication_Request copyWith(void Function(CreateJobApplication_Request) updates) => super.copyWith((message) => updates(message as CreateJobApplication_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication_Request create() => CreateJobApplication_Request._();
  CreateJobApplication_Request createEmptyInstance() => create();
  static $pb.PbList<CreateJobApplication_Request> createRepeated() => $pb.PbList<CreateJobApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateJobApplication_Request>(create);
  static CreateJobApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class CreateJobApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateJobApplication.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CreateJobApplication_Response._() : super();
  factory CreateJobApplication_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CreateJobApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateJobApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateJobApplication_Response clone() => CreateJobApplication_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateJobApplication_Response copyWith(void Function(CreateJobApplication_Response) updates) => super.copyWith((message) => updates(message as CreateJobApplication_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication_Response create() => CreateJobApplication_Response._();
  CreateJobApplication_Response createEmptyInstance() => create();
  static $pb.PbList<CreateJobApplication_Response> createRepeated() => $pb.PbList<CreateJobApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateJobApplication_Response>(create);
  static CreateJobApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateJobApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateJobApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateJobApplication._() : super();
  factory CreateJobApplication() => create();
  factory CreateJobApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateJobApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateJobApplication clone() => CreateJobApplication()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateJobApplication copyWith(void Function(CreateJobApplication) updates) => super.copyWith((message) => updates(message as CreateJobApplication)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication create() => CreateJobApplication._();
  CreateJobApplication createEmptyInstance() => create();
  static $pb.PbList<CreateJobApplication> createRepeated() => $pb.PbList<CreateJobApplication>();
  @$core.pragma('dart2js:noInline')
  static CreateJobApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateJobApplication>(create);
  static CreateJobApplication _defaultInstance;
}

class UpdateJobApplicationDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobApplicationDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateJobApplicationDetails_Request._() : super();
  factory UpdateJobApplicationDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UpdateJobApplicationDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobApplicationDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails_Request clone() => UpdateJobApplicationDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails_Request copyWith(void Function(UpdateJobApplicationDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateJobApplicationDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails_Request create() => UpdateJobApplicationDetails_Request._();
  UpdateJobApplicationDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateJobApplicationDetails_Request> createRepeated() => $pb.PbList<UpdateJobApplicationDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobApplicationDetails_Request>(create);
  static UpdateJobApplicationDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateJobApplicationDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobApplicationDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UpdateJobApplicationDetails_Response._() : super();
  factory UpdateJobApplicationDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UpdateJobApplicationDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobApplicationDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails_Response clone() => UpdateJobApplicationDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails_Response copyWith(void Function(UpdateJobApplicationDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateJobApplicationDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails_Response create() => UpdateJobApplicationDetails_Response._();
  UpdateJobApplicationDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateJobApplicationDetails_Response> createRepeated() => $pb.PbList<UpdateJobApplicationDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobApplicationDetails_Response>(create);
  static UpdateJobApplicationDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateJobApplicationDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateJobApplicationDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateJobApplicationDetails._() : super();
  factory UpdateJobApplicationDetails() => create();
  factory UpdateJobApplicationDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateJobApplicationDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails clone() => UpdateJobApplicationDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateJobApplicationDetails copyWith(void Function(UpdateJobApplicationDetails) updates) => super.copyWith((message) => updates(message as UpdateJobApplicationDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails create() => UpdateJobApplicationDetails._();
  UpdateJobApplicationDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateJobApplicationDetails> createRepeated() => $pb.PbList<UpdateJobApplicationDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateJobApplicationDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateJobApplicationDetails>(create);
  static UpdateJobApplicationDetails _defaultInstance;
}

class UncreateJobApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJobApplication.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateJobApplication_Request._() : super();
  factory UncreateJobApplication_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory UncreateJobApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJobApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJobApplication_Request clone() => UncreateJobApplication_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJobApplication_Request copyWith(void Function(UncreateJobApplication_Request) updates) => super.copyWith((message) => updates(message as UncreateJobApplication_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication_Request create() => UncreateJobApplication_Request._();
  UncreateJobApplication_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateJobApplication_Request> createRepeated() => $pb.PbList<UncreateJobApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJobApplication_Request>(create);
  static UncreateJobApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateJobApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJobApplication.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  UncreateJobApplication_Response._() : super();
  factory UncreateJobApplication_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory UncreateJobApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJobApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJobApplication_Response clone() => UncreateJobApplication_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJobApplication_Response copyWith(void Function(UncreateJobApplication_Response) updates) => super.copyWith((message) => updates(message as UncreateJobApplication_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication_Response create() => UncreateJobApplication_Response._();
  UncreateJobApplication_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateJobApplication_Response> createRepeated() => $pb.PbList<UncreateJobApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJobApplication_Response>(create);
  static UncreateJobApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateJobApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UncreateJobApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateJobApplication._() : super();
  factory UncreateJobApplication() => create();
  factory UncreateJobApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateJobApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UncreateJobApplication clone() => UncreateJobApplication()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UncreateJobApplication copyWith(void Function(UncreateJobApplication) updates) => super.copyWith((message) => updates(message as UncreateJobApplication)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication create() => UncreateJobApplication._();
  UncreateJobApplication createEmptyInstance() => create();
  static $pb.PbList<UncreateJobApplication> createRepeated() => $pb.PbList<UncreateJobApplication>();
  @$core.pragma('dart2js:noInline')
  static UncreateJobApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateJobApplication>(create);
  static UncreateJobApplication _defaultInstance;
}

class FetchJobApplicationIds_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationIds.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobId', $pb.PbFieldType.O3, protoName: 'jobId')
    ..hasRequiredFields = false
  ;

  FetchJobApplicationIds_Request._() : super();
  factory FetchJobApplicationIds_Request({
    $core.String sessionKey,
    $core.int jobId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobId != null) {
      _result.jobId = jobId;
    }
    return _result;
  }
  factory FetchJobApplicationIds_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationIds_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds_Request clone() => FetchJobApplicationIds_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds_Request copyWith(void Function(FetchJobApplicationIds_Request) updates) => super.copyWith((message) => updates(message as FetchJobApplicationIds_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds_Request create() => FetchJobApplicationIds_Request._();
  FetchJobApplicationIds_Request createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationIds_Request> createRepeated() => $pb.PbList<FetchJobApplicationIds_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationIds_Request>(create);
  static FetchJobApplicationIds_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobId() => clearField(2);
}

class FetchJobApplicationIds_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationIds.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  FetchJobApplicationIds_Response._() : super();
  factory FetchJobApplicationIds_Response({
    $core.bool success,
    $core.Iterable<$core.int> id,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id.addAll(id);
    }
    return _result;
  }
  factory FetchJobApplicationIds_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationIds_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds_Response clone() => FetchJobApplicationIds_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds_Response copyWith(void Function(FetchJobApplicationIds_Response) updates) => super.copyWith((message) => updates(message as FetchJobApplicationIds_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds_Response create() => FetchJobApplicationIds_Response._();
  FetchJobApplicationIds_Response createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationIds_Response> createRepeated() => $pb.PbList<FetchJobApplicationIds_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationIds_Response>(create);
  static FetchJobApplicationIds_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get id => $_getList(1);
}

class FetchJobApplicationIds extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationIds', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchJobApplicationIds._() : super();
  factory FetchJobApplicationIds() => create();
  factory FetchJobApplicationIds.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationIds.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds clone() => FetchJobApplicationIds()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationIds copyWith(void Function(FetchJobApplicationIds) updates) => super.copyWith((message) => updates(message as FetchJobApplicationIds)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds create() => FetchJobApplicationIds._();
  FetchJobApplicationIds createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationIds> createRepeated() => $pb.PbList<FetchJobApplicationIds>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationIds getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationIds>(create);
  static FetchJobApplicationIds _defaultInstance;
}

class FetchJobApplicationDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobApplicationId', $pb.PbFieldType.O3, protoName: 'jobApplicationId')
    ..hasRequiredFields = false
  ;

  FetchJobApplicationDetails_Request._() : super();
  factory FetchJobApplicationDetails_Request({
    $core.String sessionKey,
    $core.int jobApplicationId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobApplicationId != null) {
      _result.jobApplicationId = jobApplicationId;
    }
    return _result;
  }
  factory FetchJobApplicationDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails_Request clone() => FetchJobApplicationDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails_Request copyWith(void Function(FetchJobApplicationDetails_Request) updates) => super.copyWith((message) => updates(message as FetchJobApplicationDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails_Request create() => FetchJobApplicationDetails_Request._();
  FetchJobApplicationDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationDetails_Request> createRepeated() => $pb.PbList<FetchJobApplicationDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationDetails_Request>(create);
  static FetchJobApplicationDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobApplicationId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobApplicationId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobApplicationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobApplicationId() => clearField(2);
}

class FetchJobApplicationDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'applicantId', $pb.PbFieldType.O3, protoName: 'applicantId')
    ..hasRequiredFields = false
  ;

  FetchJobApplicationDetails_Response._() : super();
  factory FetchJobApplicationDetails_Response({
    $core.bool success,
    $core.int id,
    $core.String message,
    $core.int applicantId,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (id != null) {
      _result.id = id;
    }
    if (message != null) {
      _result.message = message;
    }
    if (applicantId != null) {
      _result.applicantId = applicantId;
    }
    return _result;
  }
  factory FetchJobApplicationDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails_Response clone() => FetchJobApplicationDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails_Response copyWith(void Function(FetchJobApplicationDetails_Response) updates) => super.copyWith((message) => updates(message as FetchJobApplicationDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails_Response create() => FetchJobApplicationDetails_Response._();
  FetchJobApplicationDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationDetails_Response> createRepeated() => $pb.PbList<FetchJobApplicationDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationDetails_Response>(create);
  static FetchJobApplicationDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get applicantId => $_getIZ(3);
  @$pb.TagNumber(4)
  set applicantId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasApplicantId() => $_has(3);
  @$pb.TagNumber(4)
  void clearApplicantId() => clearField(4);
}

class FetchJobApplicationDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchJobApplicationDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchJobApplicationDetails._() : super();
  factory FetchJobApplicationDetails() => create();
  factory FetchJobApplicationDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchJobApplicationDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails clone() => FetchJobApplicationDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchJobApplicationDetails copyWith(void Function(FetchJobApplicationDetails) updates) => super.copyWith((message) => updates(message as FetchJobApplicationDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails create() => FetchJobApplicationDetails._();
  FetchJobApplicationDetails createEmptyInstance() => create();
  static $pb.PbList<FetchJobApplicationDetails> createRepeated() => $pb.PbList<FetchJobApplicationDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchJobApplicationDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchJobApplicationDetails>(create);
  static FetchJobApplicationDetails _defaultInstance;
}

class ApproveJobApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApproveJobApplication.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobApplicationId', $pb.PbFieldType.O3, protoName: 'jobApplicationId')
    ..hasRequiredFields = false
  ;

  ApproveJobApplication_Request._() : super();
  factory ApproveJobApplication_Request({
    $core.String sessionKey,
    $core.int jobApplicationId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobApplicationId != null) {
      _result.jobApplicationId = jobApplicationId;
    }
    return _result;
  }
  factory ApproveJobApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveJobApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveJobApplication_Request clone() => ApproveJobApplication_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveJobApplication_Request copyWith(void Function(ApproveJobApplication_Request) updates) => super.copyWith((message) => updates(message as ApproveJobApplication_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication_Request create() => ApproveJobApplication_Request._();
  ApproveJobApplication_Request createEmptyInstance() => create();
  static $pb.PbList<ApproveJobApplication_Request> createRepeated() => $pb.PbList<ApproveJobApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveJobApplication_Request>(create);
  static ApproveJobApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobApplicationId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobApplicationId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobApplicationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobApplicationId() => clearField(2);
}

class ApproveJobApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApproveJobApplication.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  ApproveJobApplication_Response._() : super();
  factory ApproveJobApplication_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory ApproveJobApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveJobApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveJobApplication_Response clone() => ApproveJobApplication_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveJobApplication_Response copyWith(void Function(ApproveJobApplication_Response) updates) => super.copyWith((message) => updates(message as ApproveJobApplication_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication_Response create() => ApproveJobApplication_Response._();
  ApproveJobApplication_Response createEmptyInstance() => create();
  static $pb.PbList<ApproveJobApplication_Response> createRepeated() => $pb.PbList<ApproveJobApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveJobApplication_Response>(create);
  static ApproveJobApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ApproveJobApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApproveJobApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ApproveJobApplication._() : super();
  factory ApproveJobApplication() => create();
  factory ApproveJobApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveJobApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveJobApplication clone() => ApproveJobApplication()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveJobApplication copyWith(void Function(ApproveJobApplication) updates) => super.copyWith((message) => updates(message as ApproveJobApplication)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication create() => ApproveJobApplication._();
  ApproveJobApplication createEmptyInstance() => create();
  static $pb.PbList<ApproveJobApplication> createRepeated() => $pb.PbList<ApproveJobApplication>();
  @$core.pragma('dart2js:noInline')
  static ApproveJobApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveJobApplication>(create);
  static ApproveJobApplication _defaultInstance;
}

class DeclineJobApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeclineJobApplication.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'jobApplicationId', $pb.PbFieldType.O3, protoName: 'jobApplicationId')
    ..hasRequiredFields = false
  ;

  DeclineJobApplication_Request._() : super();
  factory DeclineJobApplication_Request({
    $core.String sessionKey,
    $core.int jobApplicationId,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    if (jobApplicationId != null) {
      _result.jobApplicationId = jobApplicationId;
    }
    return _result;
  }
  factory DeclineJobApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeclineJobApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeclineJobApplication_Request clone() => DeclineJobApplication_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeclineJobApplication_Request copyWith(void Function(DeclineJobApplication_Request) updates) => super.copyWith((message) => updates(message as DeclineJobApplication_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication_Request create() => DeclineJobApplication_Request._();
  DeclineJobApplication_Request createEmptyInstance() => create();
  static $pb.PbList<DeclineJobApplication_Request> createRepeated() => $pb.PbList<DeclineJobApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeclineJobApplication_Request>(create);
  static DeclineJobApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jobApplicationId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jobApplicationId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasJobApplicationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJobApplicationId() => clearField(2);
}

class DeclineJobApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeclineJobApplication.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  DeclineJobApplication_Response._() : super();
  factory DeclineJobApplication_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory DeclineJobApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeclineJobApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeclineJobApplication_Response clone() => DeclineJobApplication_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeclineJobApplication_Response copyWith(void Function(DeclineJobApplication_Response) updates) => super.copyWith((message) => updates(message as DeclineJobApplication_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication_Response create() => DeclineJobApplication_Response._();
  DeclineJobApplication_Response createEmptyInstance() => create();
  static $pb.PbList<DeclineJobApplication_Response> createRepeated() => $pb.PbList<DeclineJobApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeclineJobApplication_Response>(create);
  static DeclineJobApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class DeclineJobApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeclineJobApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeclineJobApplication._() : super();
  factory DeclineJobApplication() => create();
  factory DeclineJobApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeclineJobApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeclineJobApplication clone() => DeclineJobApplication()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeclineJobApplication copyWith(void Function(DeclineJobApplication) updates) => super.copyWith((message) => updates(message as DeclineJobApplication)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication create() => DeclineJobApplication._();
  DeclineJobApplication createEmptyInstance() => create();
  static $pb.PbList<DeclineJobApplication> createRepeated() => $pb.PbList<DeclineJobApplication>();
  @$core.pragma('dart2js:noInline')
  static DeclineJobApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeclineJobApplication>(create);
  static DeclineJobApplication _defaultInstance;
}

class LogPurchase_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogPurchase.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  LogPurchase_Request._() : super();
  factory LogPurchase_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory LogPurchase_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogPurchase_Request clone() => LogPurchase_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogPurchase_Request copyWith(void Function(LogPurchase_Request) updates) => super.copyWith((message) => updates(message as LogPurchase_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogPurchase_Request create() => LogPurchase_Request._();
  LogPurchase_Request createEmptyInstance() => create();
  static $pb.PbList<LogPurchase_Request> createRepeated() => $pb.PbList<LogPurchase_Request>();
  @$core.pragma('dart2js:noInline')
  static LogPurchase_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogPurchase_Request>(create);
  static LogPurchase_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class LogPurchase_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogPurchase.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  LogPurchase_Response._() : super();
  factory LogPurchase_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory LogPurchase_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogPurchase_Response clone() => LogPurchase_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogPurchase_Response copyWith(void Function(LogPurchase_Response) updates) => super.copyWith((message) => updates(message as LogPurchase_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogPurchase_Response create() => LogPurchase_Response._();
  LogPurchase_Response createEmptyInstance() => create();
  static $pb.PbList<LogPurchase_Response> createRepeated() => $pb.PbList<LogPurchase_Response>();
  @$core.pragma('dart2js:noInline')
  static LogPurchase_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogPurchase_Response>(create);
  static LogPurchase_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class LogPurchase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LogPurchase', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LogPurchase._() : super();
  factory LogPurchase() => create();
  factory LogPurchase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogPurchase clone() => LogPurchase()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogPurchase copyWith(void Function(LogPurchase) updates) => super.copyWith((message) => updates(message as LogPurchase)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogPurchase create() => LogPurchase._();
  LogPurchase createEmptyInstance() => create();
  static $pb.PbList<LogPurchase> createRepeated() => $pb.PbList<LogPurchase>();
  @$core.pragma('dart2js:noInline')
  static LogPurchase getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogPurchase>(create);
  static LogPurchase _defaultInstance;
}

class FetchPurchases_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchases.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchPurchases_Request._() : super();
  factory FetchPurchases_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory FetchPurchases_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchases_Request clone() => FetchPurchases_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchases_Request copyWith(void Function(FetchPurchases_Request) updates) => super.copyWith((message) => updates(message as FetchPurchases_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchases_Request create() => FetchPurchases_Request._();
  FetchPurchases_Request createEmptyInstance() => create();
  static $pb.PbList<FetchPurchases_Request> createRepeated() => $pb.PbList<FetchPurchases_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchases_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchases_Request>(create);
  static FetchPurchases_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchPurchases_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchases.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  FetchPurchases_Response._() : super();
  factory FetchPurchases_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory FetchPurchases_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchases_Response clone() => FetchPurchases_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchases_Response copyWith(void Function(FetchPurchases_Response) updates) => super.copyWith((message) => updates(message as FetchPurchases_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchases_Response create() => FetchPurchases_Response._();
  FetchPurchases_Response createEmptyInstance() => create();
  static $pb.PbList<FetchPurchases_Response> createRepeated() => $pb.PbList<FetchPurchases_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchases_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchases_Response>(create);
  static FetchPurchases_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FetchPurchases extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchases', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchPurchases._() : super();
  factory FetchPurchases() => create();
  factory FetchPurchases.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchases clone() => FetchPurchases()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchases copyWith(void Function(FetchPurchases) updates) => super.copyWith((message) => updates(message as FetchPurchases)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchases create() => FetchPurchases._();
  FetchPurchases createEmptyInstance() => create();
  static $pb.PbList<FetchPurchases> createRepeated() => $pb.PbList<FetchPurchases>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchases getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchases>(create);
  static FetchPurchases _defaultInstance;
}

class FetchPurchaseDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchaseDetails.Request', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails_Request._() : super();
  factory FetchPurchaseDetails_Request({
    $core.String sessionKey,
  }) {
    final _result = create();
    if (sessionKey != null) {
      _result.sessionKey = sessionKey;
    }
    return _result;
  }
  factory FetchPurchaseDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails_Request clone() => FetchPurchaseDetails_Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails_Request copyWith(void Function(FetchPurchaseDetails_Request) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails_Request)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails_Request create() => FetchPurchaseDetails_Request._();
  FetchPurchaseDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchPurchaseDetails_Request> createRepeated() => $pb.PbList<FetchPurchaseDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchaseDetails_Request>(create);
  static FetchPurchaseDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchPurchaseDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchaseDetails.Response', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails_Response._() : super();
  factory FetchPurchaseDetails_Response({
    $core.bool success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory FetchPurchaseDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails_Response clone() => FetchPurchaseDetails_Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails_Response copyWith(void Function(FetchPurchaseDetails_Response) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails_Response)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails_Response create() => FetchPurchaseDetails_Response._();
  FetchPurchaseDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchPurchaseDetails_Response> createRepeated() => $pb.PbList<FetchPurchaseDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchaseDetails_Response>(create);
  static FetchPurchaseDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FetchPurchaseDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchPurchaseDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails._() : super();
  factory FetchPurchaseDetails() => create();
  factory FetchPurchaseDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails clone() => FetchPurchaseDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchPurchaseDetails copyWith(void Function(FetchPurchaseDetails) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails create() => FetchPurchaseDetails._();
  FetchPurchaseDetails createEmptyInstance() => create();
  static $pb.PbList<FetchPurchaseDetails> createRepeated() => $pb.PbList<FetchPurchaseDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchaseDetails>(create);
  static FetchPurchaseDetails _defaultInstance;
}

