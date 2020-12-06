///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthenticateUser_AuthMethod extends $pb.ProtobufEnum {
  static const AuthenticateUser_AuthMethod GOOGLE = AuthenticateUser_AuthMethod._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const AuthenticateUser_AuthMethod FACEBOOK = AuthenticateUser_AuthMethod._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FACEBOOK');
  static const AuthenticateUser_AuthMethod KAKAOTALK = AuthenticateUser_AuthMethod._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KAKAOTALK');
  static const AuthenticateUser_AuthMethod PHONE = AuthenticateUser_AuthMethod._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE');
  static const AuthenticateUser_AuthMethod APPLE = AuthenticateUser_AuthMethod._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APPLE');

  static const $core.List<AuthenticateUser_AuthMethod> values = <AuthenticateUser_AuthMethod> [
    GOOGLE,
    FACEBOOK,
    KAKAOTALK,
    PHONE,
    APPLE,
  ];

  static final $core.Map<$core.int, AuthenticateUser_AuthMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthenticateUser_AuthMethod valueOf($core.int value) => _byValue[value];

  const AuthenticateUser_AuthMethod._($core.int v, $core.String n) : super(v, n);
}

