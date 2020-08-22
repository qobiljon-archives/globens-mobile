///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthenticateUser_AuthMethod extends $pb.ProtobufEnum {
  static const AuthenticateUser_AuthMethod GOOGLE = AuthenticateUser_AuthMethod._(0, 'GOOGLE');
  static const AuthenticateUser_AuthMethod FACEBOOK = AuthenticateUser_AuthMethod._(1, 'FACEBOOK');
  static const AuthenticateUser_AuthMethod KAKAOTALK = AuthenticateUser_AuthMethod._(3, 'KAKAOTALK');
  static const AuthenticateUser_AuthMethod PHONE = AuthenticateUser_AuthMethod._(4, 'PHONE');

  static const $core.List<AuthenticateUser_AuthMethod> values = <AuthenticateUser_AuthMethod> [
    GOOGLE,
    FACEBOOK,
    KAKAOTALK,
    PHONE,
  ];

  static final $core.Map<$core.int, AuthenticateUser_AuthMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthenticateUser_AuthMethod valueOf($core.int value) => _byValue[value];

  const AuthenticateUser_AuthMethod._($core.int v, $core.String n) : super(v, n);
}

