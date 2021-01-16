///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Currency extends $pb.ProtobufEnum {
  static const Currency KRW = Currency._(0, 'KRW');
  static const Currency USD = Currency._(1, 'USD');
  static const Currency UZS = Currency._(3, 'UZS');
  static const Currency RUB = Currency._(4, 'RUB');

  static const $core.List<Currency> values = <Currency> [
    KRW,
    USD,
    UZS,
    RUB,
  ];

  static final $core.Map<$core.int, Currency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Currency valueOf($core.int value) => _byValue[value];

  const Currency._($core.int v, $core.String n) : super(v, n);
}

class AuthenticateUser_AuthMethod extends $pb.ProtobufEnum {
  static const AuthenticateUser_AuthMethod GOOGLE = AuthenticateUser_AuthMethod._(0, 'GOOGLE');
  static const AuthenticateUser_AuthMethod FACEBOOK = AuthenticateUser_AuthMethod._(1, 'FACEBOOK');
  static const AuthenticateUser_AuthMethod KAKAOTALK = AuthenticateUser_AuthMethod._(3, 'KAKAOTALK');
  static const AuthenticateUser_AuthMethod PHONE = AuthenticateUser_AuthMethod._(4, 'PHONE');
  static const AuthenticateUser_AuthMethod APPLE = AuthenticateUser_AuthMethod._(5, 'APPLE');

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

