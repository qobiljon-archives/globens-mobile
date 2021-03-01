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

class ProductDeliveryType extends $pb.ProtobufEnum {
  static const ProductDeliveryType FILE_DOWNLOADABLE = ProductDeliveryType._(0, 'FILE_DOWNLOADABLE');
  static const ProductDeliveryType FILE_STREAMED = ProductDeliveryType._(1, 'FILE_STREAMED');
  static const ProductDeliveryType SCHEDULED_FACE_TO_FACE = ProductDeliveryType._(3, 'SCHEDULED_FACE_TO_FACE');
  static const ProductDeliveryType SCHEDULED_ONLINE_CALL = ProductDeliveryType._(4, 'SCHEDULED_ONLINE_CALL');

  static const $core.List<ProductDeliveryType> values = <ProductDeliveryType> [
    FILE_DOWNLOADABLE,
    FILE_STREAMED,
    SCHEDULED_FACE_TO_FACE,
    SCHEDULED_ONLINE_CALL,
  ];

  static final $core.Map<$core.int, ProductDeliveryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProductDeliveryType valueOf($core.int value) => _byValue[value];

  const ProductDeliveryType._($core.int v, $core.String n) : super(v, n);
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

