///
//  Generated code. Do not modify.
//  source: gb_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthMethod extends $pb.ProtobufEnum {
  static const AuthMethod APPLE = AuthMethod._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APPLE');
  static const AuthMethod GOOGLE = AuthMethod._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');

  static const $core.List<AuthMethod> values = <AuthMethod> [
    APPLE,
    GOOGLE,
  ];

  static final $core.Map<$core.int, AuthMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthMethod? valueOf($core.int value) => _byValue[value];

  const AuthMethod._($core.int v, $core.String n) : super(v, n);
}

class Currency extends $pb.ProtobufEnum {
  static const Currency KRW = Currency._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KRW');
  static const Currency USD = Currency._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USD');
  static const Currency UZS = Currency._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UZS');
  static const Currency RUB = Currency._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RUB');

  static const $core.List<Currency> values = <Currency> [
    KRW,
    USD,
    UZS,
    RUB,
  ];

  static final $core.Map<$core.int, Currency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Currency? valueOf($core.int value) => _byValue[value];

  const Currency._($core.int v, $core.String n) : super(v, n);
}

class ProductDeliveryType extends $pb.ProtobufEnum {
  static const ProductDeliveryType FILE_DOWNLOADABLE = ProductDeliveryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FILE_DOWNLOADABLE');
  static const ProductDeliveryType FILE_STREAMED = ProductDeliveryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FILE_STREAMED');
  static const ProductDeliveryType SCHEDULED_FACE_TO_FACE = ProductDeliveryType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_FACE_TO_FACE');
  static const ProductDeliveryType SCHEDULED_ONLINE_CALL = ProductDeliveryType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_ONLINE_CALL');

  static const $core.List<ProductDeliveryType> values = <ProductDeliveryType> [
    FILE_DOWNLOADABLE,
    FILE_STREAMED,
    SCHEDULED_FACE_TO_FACE,
    SCHEDULED_ONLINE_CALL,
  ];

  static final $core.Map<$core.int, ProductDeliveryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProductDeliveryType? valueOf($core.int value) => _byValue[value];

  const ProductDeliveryType._($core.int v, $core.String n) : super(v, n);
}

