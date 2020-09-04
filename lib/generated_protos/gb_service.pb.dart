///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'gb_service.pbenum.dart';

export 'gb_service.pbenum.dart';

class AuthenticateUser_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthenticateUser.Request', createEmptyInstance: create)
    ..e<AuthenticateUser_AuthMethod>(1, 'method', $pb.PbFieldType.OE, defaultOrMaker: AuthenticateUser_AuthMethod.GOOGLE, valueOf: AuthenticateUser_AuthMethod.valueOf, enumValues: AuthenticateUser_AuthMethod.values)
    ..aOS(2, 'tokensJson', protoName: 'tokensJson')
    ..hasRequiredFields = false
  ;

  AuthenticateUser_Request._() : super();
  factory AuthenticateUser_Request() => create();
  factory AuthenticateUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthenticateUser_Request clone() => AuthenticateUser_Request()..mergeFromMessage(this);
  AuthenticateUser_Request copyWith(void Function(AuthenticateUser_Request) updates) => super.copyWith((message) => updates(message as AuthenticateUser_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthenticateUser.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..aOS(2, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  AuthenticateUser_Response._() : super();
  factory AuthenticateUser_Response() => create();
  factory AuthenticateUser_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthenticateUser_Response clone() => AuthenticateUser_Response()..mergeFromMessage(this);
  AuthenticateUser_Response copyWith(void Function(AuthenticateUser_Response) updates) => super.copyWith((message) => updates(message as AuthenticateUser_Response));
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
  $core.String get sessionKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionKey() => clearField(2);
}

class AuthenticateUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AuthenticateUser', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  AuthenticateUser._() : super();
  factory AuthenticateUser() => create();
  factory AuthenticateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthenticateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AuthenticateUser clone() => AuthenticateUser()..mergeFromMessage(this);
  AuthenticateUser copyWith(void Function(AuthenticateUser) updates) => super.copyWith((message) => updates(message as AuthenticateUser));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeactivateUser.Request', createEmptyInstance: create)
    ..a<$core.int>(1, 'sessionKey', $pb.PbFieldType.O3, protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  DeactivateUser_Request._() : super();
  factory DeactivateUser_Request() => create();
  factory DeactivateUser_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeactivateUser_Request clone() => DeactivateUser_Request()..mergeFromMessage(this);
  DeactivateUser_Request copyWith(void Function(DeactivateUser_Request) updates) => super.copyWith((message) => updates(message as DeactivateUser_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeactivateUser.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  DeactivateUser_Response._() : super();
  factory DeactivateUser_Response() => create();
  factory DeactivateUser_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeactivateUser_Response clone() => DeactivateUser_Response()..mergeFromMessage(this);
  DeactivateUser_Response copyWith(void Function(DeactivateUser_Response) updates) => super.copyWith((message) => updates(message as DeactivateUser_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeactivateUser', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeactivateUser._() : super();
  factory DeactivateUser() => create();
  factory DeactivateUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeactivateUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DeactivateUser clone() => DeactivateUser()..mergeFromMessage(this);
  DeactivateUser copyWith(void Function(DeactivateUser) updates) => super.copyWith((message) => updates(message as DeactivateUser));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateUserDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateUserDetails_Request._() : super();
  factory UpdateUserDetails_Request() => create();
  factory UpdateUserDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateUserDetails_Request clone() => UpdateUserDetails_Request()..mergeFromMessage(this);
  UpdateUserDetails_Request copyWith(void Function(UpdateUserDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateUserDetails_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateUserDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UpdateUserDetails_Response._() : super();
  factory UpdateUserDetails_Response() => create();
  factory UpdateUserDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateUserDetails_Response clone() => UpdateUserDetails_Response()..mergeFromMessage(this);
  UpdateUserDetails_Response copyWith(void Function(UpdateUserDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateUserDetails_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateUserDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateUserDetails._() : super();
  factory UpdateUserDetails() => create();
  factory UpdateUserDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateUserDetails clone() => UpdateUserDetails()..mergeFromMessage(this);
  UpdateUserDetails copyWith(void Function(UpdateUserDetails) updates) => super.copyWith((message) => updates(message as UpdateUserDetails));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchUserDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchUserDetails_Request._() : super();
  factory FetchUserDetails_Request() => create();
  factory FetchUserDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchUserDetails_Request clone() => FetchUserDetails_Request()..mergeFromMessage(this);
  FetchUserDetails_Request copyWith(void Function(FetchUserDetails_Request) updates) => super.copyWith((message) => updates(message as FetchUserDetails_Request));
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
}

class FetchUserDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchUserDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchUserDetails_Response._() : super();
  factory FetchUserDetails_Response() => create();
  factory FetchUserDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchUserDetails_Response clone() => FetchUserDetails_Response()..mergeFromMessage(this);
  FetchUserDetails_Response copyWith(void Function(FetchUserDetails_Response) updates) => super.copyWith((message) => updates(message as FetchUserDetails_Response));
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
}

class FetchUserDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchUserDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchUserDetails._() : super();
  factory FetchUserDetails() => create();
  factory FetchUserDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchUserDetails clone() => FetchUserDetails()..mergeFromMessage(this);
  FetchUserDetails copyWith(void Function(FetchUserDetails) updates) => super.copyWith((message) => updates(message as FetchUserDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails create() => FetchUserDetails._();
  FetchUserDetails createEmptyInstance() => create();
  static $pb.PbList<FetchUserDetails> createRepeated() => $pb.PbList<FetchUserDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchUserDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserDetails>(create);
  static FetchUserDetails _defaultInstance;
}

class CreateVacancy_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancy.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..aOS(3, 'title')
    ..hasRequiredFields = false
  ;

  CreateVacancy_Request._() : super();
  factory CreateVacancy_Request() => create();
  factory CreateVacancy_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancy_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancy_Request clone() => CreateVacancy_Request()..mergeFromMessage(this);
  CreateVacancy_Request copyWith(void Function(CreateVacancy_Request) updates) => super.copyWith((message) => updates(message as CreateVacancy_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancy_Request create() => CreateVacancy_Request._();
  CreateVacancy_Request createEmptyInstance() => create();
  static $pb.PbList<CreateVacancy_Request> createRepeated() => $pb.PbList<CreateVacancy_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancy_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancy_Request>(create);
  static CreateVacancy_Request _defaultInstance;

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

class CreateVacancy_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancy.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  CreateVacancy_Response._() : super();
  factory CreateVacancy_Response() => create();
  factory CreateVacancy_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancy_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancy_Response clone() => CreateVacancy_Response()..mergeFromMessage(this);
  CreateVacancy_Response copyWith(void Function(CreateVacancy_Response) updates) => super.copyWith((message) => updates(message as CreateVacancy_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancy_Response create() => CreateVacancy_Response._();
  CreateVacancy_Response createEmptyInstance() => create();
  static $pb.PbList<CreateVacancy_Response> createRepeated() => $pb.PbList<CreateVacancy_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancy_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancy_Response>(create);
  static CreateVacancy_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateVacancy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancy', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateVacancy._() : super();
  factory CreateVacancy() => create();
  factory CreateVacancy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancy clone() => CreateVacancy()..mergeFromMessage(this);
  CreateVacancy copyWith(void Function(CreateVacancy) updates) => super.copyWith((message) => updates(message as CreateVacancy));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancy create() => CreateVacancy._();
  CreateVacancy createEmptyInstance() => create();
  static $pb.PbList<CreateVacancy> createRepeated() => $pb.PbList<CreateVacancy>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancy>(create);
  static CreateVacancy _defaultInstance;
}

class UpdateVacancyDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateVacancyDetails_Request._() : super();
  factory UpdateVacancyDetails_Request() => create();
  factory UpdateVacancyDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyDetails_Request clone() => UpdateVacancyDetails_Request()..mergeFromMessage(this);
  UpdateVacancyDetails_Request copyWith(void Function(UpdateVacancyDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateVacancyDetails_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails_Request create() => UpdateVacancyDetails_Request._();
  UpdateVacancyDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyDetails_Request> createRepeated() => $pb.PbList<UpdateVacancyDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyDetails_Request>(create);
  static UpdateVacancyDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateVacancyDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UpdateVacancyDetails_Response._() : super();
  factory UpdateVacancyDetails_Response() => create();
  factory UpdateVacancyDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyDetails_Response clone() => UpdateVacancyDetails_Response()..mergeFromMessage(this);
  UpdateVacancyDetails_Response copyWith(void Function(UpdateVacancyDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateVacancyDetails_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails_Response create() => UpdateVacancyDetails_Response._();
  UpdateVacancyDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyDetails_Response> createRepeated() => $pb.PbList<UpdateVacancyDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyDetails_Response>(create);
  static UpdateVacancyDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateVacancyDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateVacancyDetails._() : super();
  factory UpdateVacancyDetails() => create();
  factory UpdateVacancyDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyDetails clone() => UpdateVacancyDetails()..mergeFromMessage(this);
  UpdateVacancyDetails copyWith(void Function(UpdateVacancyDetails) updates) => super.copyWith((message) => updates(message as UpdateVacancyDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails create() => UpdateVacancyDetails._();
  UpdateVacancyDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyDetails> createRepeated() => $pb.PbList<UpdateVacancyDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyDetails>(create);
  static UpdateVacancyDetails _defaultInstance;
}

class UncreateVacancy_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancy.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateVacancy_Request._() : super();
  factory UncreateVacancy_Request() => create();
  factory UncreateVacancy_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancy_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancy_Request clone() => UncreateVacancy_Request()..mergeFromMessage(this);
  UncreateVacancy_Request copyWith(void Function(UncreateVacancy_Request) updates) => super.copyWith((message) => updates(message as UncreateVacancy_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy_Request create() => UncreateVacancy_Request._();
  UncreateVacancy_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancy_Request> createRepeated() => $pb.PbList<UncreateVacancy_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancy_Request>(create);
  static UncreateVacancy_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateVacancy_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancy.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UncreateVacancy_Response._() : super();
  factory UncreateVacancy_Response() => create();
  factory UncreateVacancy_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancy_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancy_Response clone() => UncreateVacancy_Response()..mergeFromMessage(this);
  UncreateVacancy_Response copyWith(void Function(UncreateVacancy_Response) updates) => super.copyWith((message) => updates(message as UncreateVacancy_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy_Response create() => UncreateVacancy_Response._();
  UncreateVacancy_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancy_Response> createRepeated() => $pb.PbList<UncreateVacancy_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancy_Response>(create);
  static UncreateVacancy_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateVacancy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancy', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateVacancy._() : super();
  factory UncreateVacancy() => create();
  factory UncreateVacancy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancy clone() => UncreateVacancy()..mergeFromMessage(this);
  UncreateVacancy copyWith(void Function(UncreateVacancy) updates) => super.copyWith((message) => updates(message as UncreateVacancy));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy create() => UncreateVacancy._();
  UncreateVacancy createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancy> createRepeated() => $pb.PbList<UncreateVacancy>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancy>(create);
  static UncreateVacancy _defaultInstance;
}

class FetchVacancies_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancies.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..hasRequiredFields = false
  ;

  FetchVacancies_Request._() : super();
  factory FetchVacancies_Request() => create();
  factory FetchVacancies_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancies_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancies_Request clone() => FetchVacancies_Request()..mergeFromMessage(this);
  FetchVacancies_Request copyWith(void Function(FetchVacancies_Request) updates) => super.copyWith((message) => updates(message as FetchVacancies_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancies_Request create() => FetchVacancies_Request._();
  FetchVacancies_Request createEmptyInstance() => create();
  static $pb.PbList<FetchVacancies_Request> createRepeated() => $pb.PbList<FetchVacancies_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancies_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancies_Request>(create);
  static FetchVacancies_Request _defaultInstance;

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

class FetchVacancies_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancies.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..p<$core.int>(2, 'id', $pb.PbFieldType.P3)
    ..pPS(3, 'role')
    ..pPS(4, 'title')
    ..hasRequiredFields = false
  ;

  FetchVacancies_Response._() : super();
  factory FetchVacancies_Response() => create();
  factory FetchVacancies_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancies_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancies_Response clone() => FetchVacancies_Response()..mergeFromMessage(this);
  FetchVacancies_Response copyWith(void Function(FetchVacancies_Response) updates) => super.copyWith((message) => updates(message as FetchVacancies_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancies_Response create() => FetchVacancies_Response._();
  FetchVacancies_Response createEmptyInstance() => create();
  static $pb.PbList<FetchVacancies_Response> createRepeated() => $pb.PbList<FetchVacancies_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancies_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancies_Response>(create);
  static FetchVacancies_Response _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.String> get role => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get title => $_getList(3);
}

class FetchVacancies extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancies', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchVacancies._() : super();
  factory FetchVacancies() => create();
  factory FetchVacancies.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancies.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancies clone() => FetchVacancies()..mergeFromMessage(this);
  FetchVacancies copyWith(void Function(FetchVacancies) updates) => super.copyWith((message) => updates(message as FetchVacancies));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancies create() => FetchVacancies._();
  FetchVacancies createEmptyInstance() => create();
  static $pb.PbList<FetchVacancies> createRepeated() => $pb.PbList<FetchVacancies>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancies getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancies>(create);
  static FetchVacancies _defaultInstance;
}

class FetchVacancyDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchVacancyDetails_Request._() : super();
  factory FetchVacancyDetails_Request() => create();
  factory FetchVacancyDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyDetails_Request clone() => FetchVacancyDetails_Request()..mergeFromMessage(this);
  FetchVacancyDetails_Request copyWith(void Function(FetchVacancyDetails_Request) updates) => super.copyWith((message) => updates(message as FetchVacancyDetails_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails_Request create() => FetchVacancyDetails_Request._();
  FetchVacancyDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyDetails_Request> createRepeated() => $pb.PbList<FetchVacancyDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyDetails_Request>(create);
  static FetchVacancyDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchVacancyDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchVacancyDetails_Response._() : super();
  factory FetchVacancyDetails_Response() => create();
  factory FetchVacancyDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyDetails_Response clone() => FetchVacancyDetails_Response()..mergeFromMessage(this);
  FetchVacancyDetails_Response copyWith(void Function(FetchVacancyDetails_Response) updates) => super.copyWith((message) => updates(message as FetchVacancyDetails_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails_Response create() => FetchVacancyDetails_Response._();
  FetchVacancyDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyDetails_Response> createRepeated() => $pb.PbList<FetchVacancyDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyDetails_Response>(create);
  static FetchVacancyDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FetchVacancyDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchVacancyDetails._() : super();
  factory FetchVacancyDetails() => create();
  factory FetchVacancyDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyDetails clone() => FetchVacancyDetails()..mergeFromMessage(this);
  FetchVacancyDetails copyWith(void Function(FetchVacancyDetails) updates) => super.copyWith((message) => updates(message as FetchVacancyDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails create() => FetchVacancyDetails._();
  FetchVacancyDetails createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyDetails> createRepeated() => $pb.PbList<FetchVacancyDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyDetails>(create);
  static FetchVacancyDetails _defaultInstance;
}

class CreateVacancyApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancyApplication.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  CreateVacancyApplication_Request._() : super();
  factory CreateVacancyApplication_Request() => create();
  factory CreateVacancyApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancyApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancyApplication_Request clone() => CreateVacancyApplication_Request()..mergeFromMessage(this);
  CreateVacancyApplication_Request copyWith(void Function(CreateVacancyApplication_Request) updates) => super.copyWith((message) => updates(message as CreateVacancyApplication_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication_Request create() => CreateVacancyApplication_Request._();
  CreateVacancyApplication_Request createEmptyInstance() => create();
  static $pb.PbList<CreateVacancyApplication_Request> createRepeated() => $pb.PbList<CreateVacancyApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancyApplication_Request>(create);
  static CreateVacancyApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class CreateVacancyApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancyApplication.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  CreateVacancyApplication_Response._() : super();
  factory CreateVacancyApplication_Response() => create();
  factory CreateVacancyApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancyApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancyApplication_Response clone() => CreateVacancyApplication_Response()..mergeFromMessage(this);
  CreateVacancyApplication_Response copyWith(void Function(CreateVacancyApplication_Response) updates) => super.copyWith((message) => updates(message as CreateVacancyApplication_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication_Response create() => CreateVacancyApplication_Response._();
  CreateVacancyApplication_Response createEmptyInstance() => create();
  static $pb.PbList<CreateVacancyApplication_Response> createRepeated() => $pb.PbList<CreateVacancyApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancyApplication_Response>(create);
  static CreateVacancyApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class CreateVacancyApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateVacancyApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateVacancyApplication._() : super();
  factory CreateVacancyApplication() => create();
  factory CreateVacancyApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateVacancyApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateVacancyApplication clone() => CreateVacancyApplication()..mergeFromMessage(this);
  CreateVacancyApplication copyWith(void Function(CreateVacancyApplication) updates) => super.copyWith((message) => updates(message as CreateVacancyApplication));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication create() => CreateVacancyApplication._();
  CreateVacancyApplication createEmptyInstance() => create();
  static $pb.PbList<CreateVacancyApplication> createRepeated() => $pb.PbList<CreateVacancyApplication>();
  @$core.pragma('dart2js:noInline')
  static CreateVacancyApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateVacancyApplication>(create);
  static CreateVacancyApplication _defaultInstance;
}

class UpdateVacancyApplicationDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyApplicationDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateVacancyApplicationDetails_Request._() : super();
  factory UpdateVacancyApplicationDetails_Request() => create();
  factory UpdateVacancyApplicationDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyApplicationDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyApplicationDetails_Request clone() => UpdateVacancyApplicationDetails_Request()..mergeFromMessage(this);
  UpdateVacancyApplicationDetails_Request copyWith(void Function(UpdateVacancyApplicationDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateVacancyApplicationDetails_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails_Request create() => UpdateVacancyApplicationDetails_Request._();
  UpdateVacancyApplicationDetails_Request createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyApplicationDetails_Request> createRepeated() => $pb.PbList<UpdateVacancyApplicationDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyApplicationDetails_Request>(create);
  static UpdateVacancyApplicationDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UpdateVacancyApplicationDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyApplicationDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UpdateVacancyApplicationDetails_Response._() : super();
  factory UpdateVacancyApplicationDetails_Response() => create();
  factory UpdateVacancyApplicationDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyApplicationDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyApplicationDetails_Response clone() => UpdateVacancyApplicationDetails_Response()..mergeFromMessage(this);
  UpdateVacancyApplicationDetails_Response copyWith(void Function(UpdateVacancyApplicationDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateVacancyApplicationDetails_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails_Response create() => UpdateVacancyApplicationDetails_Response._();
  UpdateVacancyApplicationDetails_Response createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyApplicationDetails_Response> createRepeated() => $pb.PbList<UpdateVacancyApplicationDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyApplicationDetails_Response>(create);
  static UpdateVacancyApplicationDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UpdateVacancyApplicationDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateVacancyApplicationDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateVacancyApplicationDetails._() : super();
  factory UpdateVacancyApplicationDetails() => create();
  factory UpdateVacancyApplicationDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateVacancyApplicationDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateVacancyApplicationDetails clone() => UpdateVacancyApplicationDetails()..mergeFromMessage(this);
  UpdateVacancyApplicationDetails copyWith(void Function(UpdateVacancyApplicationDetails) updates) => super.copyWith((message) => updates(message as UpdateVacancyApplicationDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails create() => UpdateVacancyApplicationDetails._();
  UpdateVacancyApplicationDetails createEmptyInstance() => create();
  static $pb.PbList<UpdateVacancyApplicationDetails> createRepeated() => $pb.PbList<UpdateVacancyApplicationDetails>();
  @$core.pragma('dart2js:noInline')
  static UpdateVacancyApplicationDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateVacancyApplicationDetails>(create);
  static UpdateVacancyApplicationDetails _defaultInstance;
}

class UncreateVacancyApplication_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancyApplication.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateVacancyApplication_Request._() : super();
  factory UncreateVacancyApplication_Request() => create();
  factory UncreateVacancyApplication_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancyApplication_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancyApplication_Request clone() => UncreateVacancyApplication_Request()..mergeFromMessage(this);
  UncreateVacancyApplication_Request copyWith(void Function(UncreateVacancyApplication_Request) updates) => super.copyWith((message) => updates(message as UncreateVacancyApplication_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication_Request create() => UncreateVacancyApplication_Request._();
  UncreateVacancyApplication_Request createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancyApplication_Request> createRepeated() => $pb.PbList<UncreateVacancyApplication_Request>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancyApplication_Request>(create);
  static UncreateVacancyApplication_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class UncreateVacancyApplication_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancyApplication.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UncreateVacancyApplication_Response._() : super();
  factory UncreateVacancyApplication_Response() => create();
  factory UncreateVacancyApplication_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancyApplication_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancyApplication_Response clone() => UncreateVacancyApplication_Response()..mergeFromMessage(this);
  UncreateVacancyApplication_Response copyWith(void Function(UncreateVacancyApplication_Response) updates) => super.copyWith((message) => updates(message as UncreateVacancyApplication_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication_Response create() => UncreateVacancyApplication_Response._();
  UncreateVacancyApplication_Response createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancyApplication_Response> createRepeated() => $pb.PbList<UncreateVacancyApplication_Response>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancyApplication_Response>(create);
  static UncreateVacancyApplication_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class UncreateVacancyApplication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateVacancyApplication', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateVacancyApplication._() : super();
  factory UncreateVacancyApplication() => create();
  factory UncreateVacancyApplication.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateVacancyApplication.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateVacancyApplication clone() => UncreateVacancyApplication()..mergeFromMessage(this);
  UncreateVacancyApplication copyWith(void Function(UncreateVacancyApplication) updates) => super.copyWith((message) => updates(message as UncreateVacancyApplication));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication create() => UncreateVacancyApplication._();
  UncreateVacancyApplication createEmptyInstance() => create();
  static $pb.PbList<UncreateVacancyApplication> createRepeated() => $pb.PbList<UncreateVacancyApplication>();
  @$core.pragma('dart2js:noInline')
  static UncreateVacancyApplication getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateVacancyApplication>(create);
  static UncreateVacancyApplication _defaultInstance;
}

class FetchMyVacancyApplications_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchMyVacancyApplications.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchMyVacancyApplications_Request._() : super();
  factory FetchMyVacancyApplications_Request() => create();
  factory FetchMyVacancyApplications_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyVacancyApplications_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchMyVacancyApplications_Request clone() => FetchMyVacancyApplications_Request()..mergeFromMessage(this);
  FetchMyVacancyApplications_Request copyWith(void Function(FetchMyVacancyApplications_Request) updates) => super.copyWith((message) => updates(message as FetchMyVacancyApplications_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications_Request create() => FetchMyVacancyApplications_Request._();
  FetchMyVacancyApplications_Request createEmptyInstance() => create();
  static $pb.PbList<FetchMyVacancyApplications_Request> createRepeated() => $pb.PbList<FetchMyVacancyApplications_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyVacancyApplications_Request>(create);
  static FetchMyVacancyApplications_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchMyVacancyApplications_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchMyVacancyApplications.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchMyVacancyApplications_Response._() : super();
  factory FetchMyVacancyApplications_Response() => create();
  factory FetchMyVacancyApplications_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyVacancyApplications_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchMyVacancyApplications_Response clone() => FetchMyVacancyApplications_Response()..mergeFromMessage(this);
  FetchMyVacancyApplications_Response copyWith(void Function(FetchMyVacancyApplications_Response) updates) => super.copyWith((message) => updates(message as FetchMyVacancyApplications_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications_Response create() => FetchMyVacancyApplications_Response._();
  FetchMyVacancyApplications_Response createEmptyInstance() => create();
  static $pb.PbList<FetchMyVacancyApplications_Response> createRepeated() => $pb.PbList<FetchMyVacancyApplications_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyVacancyApplications_Response>(create);
  static FetchMyVacancyApplications_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FetchMyVacancyApplications extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchMyVacancyApplications', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchMyVacancyApplications._() : super();
  factory FetchMyVacancyApplications() => create();
  factory FetchMyVacancyApplications.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMyVacancyApplications.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchMyVacancyApplications clone() => FetchMyVacancyApplications()..mergeFromMessage(this);
  FetchMyVacancyApplications copyWith(void Function(FetchMyVacancyApplications) updates) => super.copyWith((message) => updates(message as FetchMyVacancyApplications));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications create() => FetchMyVacancyApplications._();
  FetchMyVacancyApplications createEmptyInstance() => create();
  static $pb.PbList<FetchMyVacancyApplications> createRepeated() => $pb.PbList<FetchMyVacancyApplications>();
  @$core.pragma('dart2js:noInline')
  static FetchMyVacancyApplications getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMyVacancyApplications>(create);
  static FetchMyVacancyApplications _defaultInstance;
}

class FetchVacancyApplicationDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyApplicationDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchVacancyApplicationDetails_Request._() : super();
  factory FetchVacancyApplicationDetails_Request() => create();
  factory FetchVacancyApplicationDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyApplicationDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyApplicationDetails_Request clone() => FetchVacancyApplicationDetails_Request()..mergeFromMessage(this);
  FetchVacancyApplicationDetails_Request copyWith(void Function(FetchVacancyApplicationDetails_Request) updates) => super.copyWith((message) => updates(message as FetchVacancyApplicationDetails_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails_Request create() => FetchVacancyApplicationDetails_Request._();
  FetchVacancyApplicationDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyApplicationDetails_Request> createRepeated() => $pb.PbList<FetchVacancyApplicationDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyApplicationDetails_Request>(create);
  static FetchVacancyApplicationDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchVacancyApplicationDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyApplicationDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchVacancyApplicationDetails_Response._() : super();
  factory FetchVacancyApplicationDetails_Response() => create();
  factory FetchVacancyApplicationDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyApplicationDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyApplicationDetails_Response clone() => FetchVacancyApplicationDetails_Response()..mergeFromMessage(this);
  FetchVacancyApplicationDetails_Response copyWith(void Function(FetchVacancyApplicationDetails_Response) updates) => super.copyWith((message) => updates(message as FetchVacancyApplicationDetails_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails_Response create() => FetchVacancyApplicationDetails_Response._();
  FetchVacancyApplicationDetails_Response createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyApplicationDetails_Response> createRepeated() => $pb.PbList<FetchVacancyApplicationDetails_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyApplicationDetails_Response>(create);
  static FetchVacancyApplicationDetails_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class FetchVacancyApplicationDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchVacancyApplicationDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchVacancyApplicationDetails._() : super();
  factory FetchVacancyApplicationDetails() => create();
  factory FetchVacancyApplicationDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchVacancyApplicationDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchVacancyApplicationDetails clone() => FetchVacancyApplicationDetails()..mergeFromMessage(this);
  FetchVacancyApplicationDetails copyWith(void Function(FetchVacancyApplicationDetails) updates) => super.copyWith((message) => updates(message as FetchVacancyApplicationDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails create() => FetchVacancyApplicationDetails._();
  FetchVacancyApplicationDetails createEmptyInstance() => create();
  static $pb.PbList<FetchVacancyApplicationDetails> createRepeated() => $pb.PbList<FetchVacancyApplicationDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchVacancyApplicationDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchVacancyApplicationDetails>(create);
  static FetchVacancyApplicationDetails _defaultInstance;
}

class CreateBusinessPage_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateBusinessPage.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..aOS(2, 'title')
    ..a<$core.List<$core.int>>(3, 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..hasRequiredFields = false
  ;

  CreateBusinessPage_Request._() : super();
  factory CreateBusinessPage_Request() => create();
  factory CreateBusinessPage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateBusinessPage_Request clone() => CreateBusinessPage_Request()..mergeFromMessage(this);
  CreateBusinessPage_Request copyWith(void Function(CreateBusinessPage_Request) updates) => super.copyWith((message) => updates(message as CreateBusinessPage_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateBusinessPage.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  CreateBusinessPage_Response._() : super();
  factory CreateBusinessPage_Response() => create();
  factory CreateBusinessPage_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateBusinessPage_Response clone() => CreateBusinessPage_Response()..mergeFromMessage(this);
  CreateBusinessPage_Response copyWith(void Function(CreateBusinessPage_Response) updates) => super.copyWith((message) => updates(message as CreateBusinessPage_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateBusinessPage', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateBusinessPage._() : super();
  factory CreateBusinessPage() => create();
  factory CreateBusinessPage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateBusinessPage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateBusinessPage clone() => CreateBusinessPage()..mergeFromMessage(this);
  CreateBusinessPage copyWith(void Function(CreateBusinessPage) updates) => super.copyWith((message) => updates(message as CreateBusinessPage));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateBusinessPageDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails_Request._() : super();
  factory UpdateBusinessPageDetails_Request() => create();
  factory UpdateBusinessPageDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateBusinessPageDetails_Request clone() => UpdateBusinessPageDetails_Request()..mergeFromMessage(this);
  UpdateBusinessPageDetails_Request copyWith(void Function(UpdateBusinessPageDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateBusinessPageDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails_Response._() : super();
  factory UpdateBusinessPageDetails_Response() => create();
  factory UpdateBusinessPageDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateBusinessPageDetails_Response clone() => UpdateBusinessPageDetails_Response()..mergeFromMessage(this);
  UpdateBusinessPageDetails_Response copyWith(void Function(UpdateBusinessPageDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateBusinessPageDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateBusinessPageDetails._() : super();
  factory UpdateBusinessPageDetails() => create();
  factory UpdateBusinessPageDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateBusinessPageDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateBusinessPageDetails clone() => UpdateBusinessPageDetails()..mergeFromMessage(this);
  UpdateBusinessPageDetails copyWith(void Function(UpdateBusinessPageDetails) updates) => super.copyWith((message) => updates(message as UpdateBusinessPageDetails));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateBusinessPage.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage_Request._() : super();
  factory UncreateBusinessPage_Request() => create();
  factory UncreateBusinessPage_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateBusinessPage_Request clone() => UncreateBusinessPage_Request()..mergeFromMessage(this);
  UncreateBusinessPage_Request copyWith(void Function(UncreateBusinessPage_Request) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateBusinessPage.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage_Response._() : super();
  factory UncreateBusinessPage_Response() => create();
  factory UncreateBusinessPage_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateBusinessPage_Response clone() => UncreateBusinessPage_Response()..mergeFromMessage(this);
  UncreateBusinessPage_Response copyWith(void Function(UncreateBusinessPage_Response) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateBusinessPage', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateBusinessPage._() : super();
  factory UncreateBusinessPage() => create();
  factory UncreateBusinessPage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateBusinessPage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateBusinessPage clone() => UncreateBusinessPage()..mergeFromMessage(this);
  UncreateBusinessPage copyWith(void Function(UncreateBusinessPage) updates) => super.copyWith((message) => updates(message as UncreateBusinessPage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage create() => UncreateBusinessPage._();
  UncreateBusinessPage createEmptyInstance() => create();
  static $pb.PbList<UncreateBusinessPage> createRepeated() => $pb.PbList<UncreateBusinessPage>();
  @$core.pragma('dart2js:noInline')
  static UncreateBusinessPage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateBusinessPage>(create);
  static UncreateBusinessPage _defaultInstance;
}

class FetchBusinessPages_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPages.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchBusinessPages_Request._() : super();
  factory FetchBusinessPages_Request() => create();
  factory FetchBusinessPages_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPages_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPages_Request clone() => FetchBusinessPages_Request()..mergeFromMessage(this);
  FetchBusinessPages_Request copyWith(void Function(FetchBusinessPages_Request) updates) => super.copyWith((message) => updates(message as FetchBusinessPages_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages_Request create() => FetchBusinessPages_Request._();
  FetchBusinessPages_Request createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPages_Request> createRepeated() => $pb.PbList<FetchBusinessPages_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPages_Request>(create);
  static FetchBusinessPages_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchBusinessPages_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPages.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..p<$core.int>(2, 'id', $pb.PbFieldType.P3)
    ..pPS(3, 'title')
    ..pPS(4, 'type')
    ..p<$core.List<$core.int>>(5, 'pictureBlob', $pb.PbFieldType.PY, protoName: 'pictureBlob')
    ..pPS(6, 'role')
    ..hasRequiredFields = false
  ;

  FetchBusinessPages_Response._() : super();
  factory FetchBusinessPages_Response() => create();
  factory FetchBusinessPages_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPages_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPages_Response clone() => FetchBusinessPages_Response()..mergeFromMessage(this);
  FetchBusinessPages_Response copyWith(void Function(FetchBusinessPages_Response) updates) => super.copyWith((message) => updates(message as FetchBusinessPages_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages_Response create() => FetchBusinessPages_Response._();
  FetchBusinessPages_Response createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPages_Response> createRepeated() => $pb.PbList<FetchBusinessPages_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPages_Response>(create);
  static FetchBusinessPages_Response _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.String> get title => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.String> get type => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get pictureBlob => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get role => $_getList(5);
}

class FetchBusinessPages extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPages', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchBusinessPages._() : super();
  factory FetchBusinessPages() => create();
  factory FetchBusinessPages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPages clone() => FetchBusinessPages()..mergeFromMessage(this);
  FetchBusinessPages copyWith(void Function(FetchBusinessPages) updates) => super.copyWith((message) => updates(message as FetchBusinessPages));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages create() => FetchBusinessPages._();
  FetchBusinessPages createEmptyInstance() => create();
  static $pb.PbList<FetchBusinessPages> createRepeated() => $pb.PbList<FetchBusinessPages>();
  @$core.pragma('dart2js:noInline')
  static FetchBusinessPages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchBusinessPages>(create);
  static FetchBusinessPages _defaultInstance;
}

class FetchBusinessPageDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPageDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails_Request._() : super();
  factory FetchBusinessPageDetails_Request() => create();
  factory FetchBusinessPageDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPageDetails_Request clone() => FetchBusinessPageDetails_Request()..mergeFromMessage(this);
  FetchBusinessPageDetails_Request copyWith(void Function(FetchBusinessPageDetails_Request) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails_Request));
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
}

class FetchBusinessPageDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPageDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails_Response._() : super();
  factory FetchBusinessPageDetails_Response() => create();
  factory FetchBusinessPageDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPageDetails_Response clone() => FetchBusinessPageDetails_Response()..mergeFromMessage(this);
  FetchBusinessPageDetails_Response copyWith(void Function(FetchBusinessPageDetails_Response) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails_Response));
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
}

class FetchBusinessPageDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchBusinessPageDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchBusinessPageDetails._() : super();
  factory FetchBusinessPageDetails() => create();
  factory FetchBusinessPageDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchBusinessPageDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchBusinessPageDetails clone() => FetchBusinessPageDetails()..mergeFromMessage(this);
  FetchBusinessPageDetails copyWith(void Function(FetchBusinessPageDetails) updates) => super.copyWith((message) => updates(message as FetchBusinessPageDetails));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateProduct.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..aOS(3, 'name')
    ..a<$core.List<$core.int>>(4, 'pictureBlob', $pb.PbFieldType.OY, protoName: 'pictureBlob')
    ..hasRequiredFields = false
  ;

  CreateProduct_Request._() : super();
  factory CreateProduct_Request() => create();
  factory CreateProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateProduct_Request clone() => CreateProduct_Request()..mergeFromMessage(this);
  CreateProduct_Request copyWith(void Function(CreateProduct_Request) updates) => super.copyWith((message) => updates(message as CreateProduct_Request));
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
  $core.List<$core.int> get pictureBlob => $_getN(3);
  @$pb.TagNumber(4)
  set pictureBlob($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPictureBlob() => $_has(3);
  @$pb.TagNumber(4)
  void clearPictureBlob() => clearField(4);
}

class CreateProduct_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateProduct.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  CreateProduct_Response._() : super();
  factory CreateProduct_Response() => create();
  factory CreateProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateProduct_Response clone() => CreateProduct_Response()..mergeFromMessage(this);
  CreateProduct_Response copyWith(void Function(CreateProduct_Response) updates) => super.copyWith((message) => updates(message as CreateProduct_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreateProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateProduct._() : super();
  factory CreateProduct() => create();
  factory CreateProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CreateProduct clone() => CreateProduct()..mergeFromMessage(this);
  CreateProduct copyWith(void Function(CreateProduct) updates) => super.copyWith((message) => updates(message as CreateProduct));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateProductDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UpdateProductDetails_Request._() : super();
  factory UpdateProductDetails_Request() => create();
  factory UpdateProductDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateProductDetails_Request clone() => UpdateProductDetails_Request()..mergeFromMessage(this);
  UpdateProductDetails_Request copyWith(void Function(UpdateProductDetails_Request) updates) => super.copyWith((message) => updates(message as UpdateProductDetails_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateProductDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UpdateProductDetails_Response._() : super();
  factory UpdateProductDetails_Response() => create();
  factory UpdateProductDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateProductDetails_Response clone() => UpdateProductDetails_Response()..mergeFromMessage(this);
  UpdateProductDetails_Response copyWith(void Function(UpdateProductDetails_Response) updates) => super.copyWith((message) => updates(message as UpdateProductDetails_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UpdateProductDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateProductDetails._() : super();
  factory UpdateProductDetails() => create();
  factory UpdateProductDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UpdateProductDetails clone() => UpdateProductDetails()..mergeFromMessage(this);
  UpdateProductDetails copyWith(void Function(UpdateProductDetails) updates) => super.copyWith((message) => updates(message as UpdateProductDetails));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateProduct.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UncreateProduct_Request._() : super();
  factory UncreateProduct_Request() => create();
  factory UncreateProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateProduct_Request clone() => UncreateProduct_Request()..mergeFromMessage(this);
  UncreateProduct_Request copyWith(void Function(UncreateProduct_Request) updates) => super.copyWith((message) => updates(message as UncreateProduct_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateProduct.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UncreateProduct_Response._() : super();
  factory UncreateProduct_Response() => create();
  factory UncreateProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateProduct_Response clone() => UncreateProduct_Response()..mergeFromMessage(this);
  UncreateProduct_Response copyWith(void Function(UncreateProduct_Response) updates) => super.copyWith((message) => updates(message as UncreateProduct_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UncreateProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UncreateProduct._() : super();
  factory UncreateProduct() => create();
  factory UncreateProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UncreateProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UncreateProduct clone() => UncreateProduct()..mergeFromMessage(this);
  UncreateProduct copyWith(void Function(UncreateProduct) updates) => super.copyWith((message) => updates(message as UncreateProduct));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UncreateProduct create() => UncreateProduct._();
  UncreateProduct createEmptyInstance() => create();
  static $pb.PbList<UncreateProduct> createRepeated() => $pb.PbList<UncreateProduct>();
  @$core.pragma('dart2js:noInline')
  static UncreateProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UncreateProduct>(create);
  static UncreateProduct _defaultInstance;
}

class FetchProducts_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProducts.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..a<$core.int>(2, 'businessPageId', $pb.PbFieldType.O3, protoName: 'businessPageId')
    ..hasRequiredFields = false
  ;

  FetchProducts_Request._() : super();
  factory FetchProducts_Request() => create();
  factory FetchProducts_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProducts_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProducts_Request clone() => FetchProducts_Request()..mergeFromMessage(this);
  FetchProducts_Request copyWith(void Function(FetchProducts_Request) updates) => super.copyWith((message) => updates(message as FetchProducts_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProducts_Request create() => FetchProducts_Request._();
  FetchProducts_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProducts_Request> createRepeated() => $pb.PbList<FetchProducts_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProducts_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProducts_Request>(create);
  static FetchProducts_Request _defaultInstance;

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

class FetchProducts_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProducts.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..p<$core.int>(2, 'id', $pb.PbFieldType.P3)
    ..pPS(3, 'name')
    ..p<$core.bool>(4, 'published', $pb.PbFieldType.PB)
    ..p<$core.List<$core.int>>(5, 'pictureBlob', $pb.PbFieldType.PY, protoName: 'pictureBlob')
    ..hasRequiredFields = false
  ;

  FetchProducts_Response._() : super();
  factory FetchProducts_Response() => create();
  factory FetchProducts_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProducts_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProducts_Response clone() => FetchProducts_Response()..mergeFromMessage(this);
  FetchProducts_Response copyWith(void Function(FetchProducts_Response) updates) => super.copyWith((message) => updates(message as FetchProducts_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProducts_Response create() => FetchProducts_Response._();
  FetchProducts_Response createEmptyInstance() => create();
  static $pb.PbList<FetchProducts_Response> createRepeated() => $pb.PbList<FetchProducts_Response>();
  @$core.pragma('dart2js:noInline')
  static FetchProducts_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProducts_Response>(create);
  static FetchProducts_Response _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.String> get name => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.bool> get published => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.List<$core.int>> get pictureBlob => $_getList(4);
}

class FetchProducts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProducts', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProducts._() : super();
  factory FetchProducts() => create();
  factory FetchProducts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProducts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProducts clone() => FetchProducts()..mergeFromMessage(this);
  FetchProducts copyWith(void Function(FetchProducts) updates) => super.copyWith((message) => updates(message as FetchProducts));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProducts create() => FetchProducts._();
  FetchProducts createEmptyInstance() => create();
  static $pb.PbList<FetchProducts> createRepeated() => $pb.PbList<FetchProducts>();
  @$core.pragma('dart2js:noInline')
  static FetchProducts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProducts>(create);
  static FetchProducts _defaultInstance;
}

class FetchProductDetails_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProductDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchProductDetails_Request._() : super();
  factory FetchProductDetails_Request() => create();
  factory FetchProductDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProductDetails_Request clone() => FetchProductDetails_Request()..mergeFromMessage(this);
  FetchProductDetails_Request copyWith(void Function(FetchProductDetails_Request) updates) => super.copyWith((message) => updates(message as FetchProductDetails_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Request create() => FetchProductDetails_Request._();
  FetchProductDetails_Request createEmptyInstance() => create();
  static $pb.PbList<FetchProductDetails_Request> createRepeated() => $pb.PbList<FetchProductDetails_Request>();
  @$core.pragma('dart2js:noInline')
  static FetchProductDetails_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchProductDetails_Request>(create);
  static FetchProductDetails_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionKey() => clearField(1);
}

class FetchProductDetails_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProductDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchProductDetails_Response._() : super();
  factory FetchProductDetails_Response() => create();
  factory FetchProductDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProductDetails_Response clone() => FetchProductDetails_Response()..mergeFromMessage(this);
  FetchProductDetails_Response copyWith(void Function(FetchProductDetails_Response) updates) => super.copyWith((message) => updates(message as FetchProductDetails_Response));
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
}

class FetchProductDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchProductDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchProductDetails._() : super();
  factory FetchProductDetails() => create();
  factory FetchProductDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchProductDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchProductDetails clone() => FetchProductDetails()..mergeFromMessage(this);
  FetchProductDetails copyWith(void Function(FetchProductDetails) updates) => super.copyWith((message) => updates(message as FetchProductDetails));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PublishProduct.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  PublishProduct_Request._() : super();
  factory PublishProduct_Request() => create();
  factory PublishProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PublishProduct_Request clone() => PublishProduct_Request()..mergeFromMessage(this);
  PublishProduct_Request copyWith(void Function(PublishProduct_Request) updates) => super.copyWith((message) => updates(message as PublishProduct_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PublishProduct.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  PublishProduct_Response._() : super();
  factory PublishProduct_Response() => create();
  factory PublishProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PublishProduct_Response clone() => PublishProduct_Response()..mergeFromMessage(this);
  PublishProduct_Response copyWith(void Function(PublishProduct_Response) updates) => super.copyWith((message) => updates(message as PublishProduct_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PublishProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PublishProduct._() : super();
  factory PublishProduct() => create();
  factory PublishProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PublishProduct clone() => PublishProduct()..mergeFromMessage(this);
  PublishProduct copyWith(void Function(PublishProduct) updates) => super.copyWith((message) => updates(message as PublishProduct));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnpublishProduct.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  UnpublishProduct_Request._() : super();
  factory UnpublishProduct_Request() => create();
  factory UnpublishProduct_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UnpublishProduct_Request clone() => UnpublishProduct_Request()..mergeFromMessage(this);
  UnpublishProduct_Request copyWith(void Function(UnpublishProduct_Request) updates) => super.copyWith((message) => updates(message as UnpublishProduct_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnpublishProduct.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  UnpublishProduct_Response._() : super();
  factory UnpublishProduct_Response() => create();
  factory UnpublishProduct_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UnpublishProduct_Response clone() => UnpublishProduct_Response()..mergeFromMessage(this);
  UnpublishProduct_Response copyWith(void Function(UnpublishProduct_Response) updates) => super.copyWith((message) => updates(message as UnpublishProduct_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UnpublishProduct', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UnpublishProduct._() : super();
  factory UnpublishProduct() => create();
  factory UnpublishProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnpublishProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UnpublishProduct clone() => UnpublishProduct()..mergeFromMessage(this);
  UnpublishProduct copyWith(void Function(UnpublishProduct) updates) => super.copyWith((message) => updates(message as UnpublishProduct));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct create() => UnpublishProduct._();
  UnpublishProduct createEmptyInstance() => create();
  static $pb.PbList<UnpublishProduct> createRepeated() => $pb.PbList<UnpublishProduct>();
  @$core.pragma('dart2js:noInline')
  static UnpublishProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnpublishProduct>(create);
  static UnpublishProduct _defaultInstance;
}

class LogPurchase_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogPurchase.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  LogPurchase_Request._() : super();
  factory LogPurchase_Request() => create();
  factory LogPurchase_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogPurchase_Request clone() => LogPurchase_Request()..mergeFromMessage(this);
  LogPurchase_Request copyWith(void Function(LogPurchase_Request) updates) => super.copyWith((message) => updates(message as LogPurchase_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogPurchase.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  LogPurchase_Response._() : super();
  factory LogPurchase_Response() => create();
  factory LogPurchase_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogPurchase_Response clone() => LogPurchase_Response()..mergeFromMessage(this);
  LogPurchase_Response copyWith(void Function(LogPurchase_Response) updates) => super.copyWith((message) => updates(message as LogPurchase_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogPurchase', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LogPurchase._() : super();
  factory LogPurchase() => create();
  factory LogPurchase.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogPurchase.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogPurchase clone() => LogPurchase()..mergeFromMessage(this);
  LogPurchase copyWith(void Function(LogPurchase) updates) => super.copyWith((message) => updates(message as LogPurchase));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchases.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchPurchases_Request._() : super();
  factory FetchPurchases_Request() => create();
  factory FetchPurchases_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchases_Request clone() => FetchPurchases_Request()..mergeFromMessage(this);
  FetchPurchases_Request copyWith(void Function(FetchPurchases_Request) updates) => super.copyWith((message) => updates(message as FetchPurchases_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchases.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchPurchases_Response._() : super();
  factory FetchPurchases_Response() => create();
  factory FetchPurchases_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchases_Response clone() => FetchPurchases_Response()..mergeFromMessage(this);
  FetchPurchases_Response copyWith(void Function(FetchPurchases_Response) updates) => super.copyWith((message) => updates(message as FetchPurchases_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchases', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchPurchases._() : super();
  factory FetchPurchases() => create();
  factory FetchPurchases.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchases.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchases clone() => FetchPurchases()..mergeFromMessage(this);
  FetchPurchases copyWith(void Function(FetchPurchases) updates) => super.copyWith((message) => updates(message as FetchPurchases));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchaseDetails.Request', createEmptyInstance: create)
    ..aOS(1, 'sessionKey', protoName: 'sessionKey')
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails_Request._() : super();
  factory FetchPurchaseDetails_Request() => create();
  factory FetchPurchaseDetails_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchaseDetails_Request clone() => FetchPurchaseDetails_Request()..mergeFromMessage(this);
  FetchPurchaseDetails_Request copyWith(void Function(FetchPurchaseDetails_Request) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails_Request));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchaseDetails.Response', createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails_Response._() : super();
  factory FetchPurchaseDetails_Response() => create();
  factory FetchPurchaseDetails_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchaseDetails_Response clone() => FetchPurchaseDetails_Response()..mergeFromMessage(this);
  FetchPurchaseDetails_Response copyWith(void Function(FetchPurchaseDetails_Response) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails_Response));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FetchPurchaseDetails', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  FetchPurchaseDetails._() : super();
  factory FetchPurchaseDetails() => create();
  factory FetchPurchaseDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchPurchaseDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FetchPurchaseDetails clone() => FetchPurchaseDetails()..mergeFromMessage(this);
  FetchPurchaseDetails copyWith(void Function(FetchPurchaseDetails) updates) => super.copyWith((message) => updates(message as FetchPurchaseDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails create() => FetchPurchaseDetails._();
  FetchPurchaseDetails createEmptyInstance() => create();
  static $pb.PbList<FetchPurchaseDetails> createRepeated() => $pb.PbList<FetchPurchaseDetails>();
  @$core.pragma('dart2js:noInline')
  static FetchPurchaseDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchPurchaseDetails>(create);
  static FetchPurchaseDetails _defaultInstance;
}

class TestSum_Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TestSum.Request', createEmptyInstance: create)
    ..a<$core.int>(1, 'a', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'b', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TestSum_Request._() : super();
  factory TestSum_Request() => create();
  factory TestSum_Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestSum_Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TestSum_Request clone() => TestSum_Request()..mergeFromMessage(this);
  TestSum_Request copyWith(void Function(TestSum_Request) updates) => super.copyWith((message) => updates(message as TestSum_Request));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestSum_Request create() => TestSum_Request._();
  TestSum_Request createEmptyInstance() => create();
  static $pb.PbList<TestSum_Request> createRepeated() => $pb.PbList<TestSum_Request>();
  @$core.pragma('dart2js:noInline')
  static TestSum_Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestSum_Request>(create);
  static TestSum_Request _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get a => $_getIZ(0);
  @$pb.TagNumber(1)
  set a($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get b => $_getIZ(1);
  @$pb.TagNumber(2)
  set b($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);
}

class TestSum_Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TestSum.Response', createEmptyInstance: create)
    ..a<$core.int>(1, 'c', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TestSum_Response._() : super();
  factory TestSum_Response() => create();
  factory TestSum_Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestSum_Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TestSum_Response clone() => TestSum_Response()..mergeFromMessage(this);
  TestSum_Response copyWith(void Function(TestSum_Response) updates) => super.copyWith((message) => updates(message as TestSum_Response));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestSum_Response create() => TestSum_Response._();
  TestSum_Response createEmptyInstance() => create();
  static $pb.PbList<TestSum_Response> createRepeated() => $pb.PbList<TestSum_Response>();
  @$core.pragma('dart2js:noInline')
  static TestSum_Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestSum_Response>(create);
  static TestSum_Response _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get c => $_getIZ(0);
  @$pb.TagNumber(1)
  set c($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasC() => $_has(0);
  @$pb.TagNumber(1)
  void clearC() => clearField(1);
}

class TestSum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TestSum', createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  TestSum._() : super();
  factory TestSum() => create();
  factory TestSum.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TestSum.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TestSum clone() => TestSum()..mergeFromMessage(this);
  TestSum copyWith(void Function(TestSum) updates) => super.copyWith((message) => updates(message as TestSum));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TestSum create() => TestSum._();
  TestSum createEmptyInstance() => create();
  static $pb.PbList<TestSum> createRepeated() => $pb.PbList<TestSum>();
  @$core.pragma('dart2js:noInline')
  static TestSum getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestSum>(create);
  static TestSum _defaultInstance;
}

