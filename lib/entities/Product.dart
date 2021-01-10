import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/ProductType.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:intl/intl.dart';
import 'BusinessPage.dart';
import 'dart:typed_data';

class Product {
  // region Constants
  static const String CREATE_ACTION = 'create';
  static const String UNCREATE_ACTION = 'uncreate';
  static const String PUBLISH_ACTION = 'publish';
  static const String UNPUBLISH_ACTION = 'unpublish';

  // endregion

  // region Variables
  int _id;
  String _name;
  ProductCategory _category;
  ProductType _type;
  Uint8List _pictureBlob;
  BusinessPage _businessPage;
  double _price;
  Currency _currency;
  String _description;

  // endregion

  Product.create(String name, ProductCategory category, ProductType type, Uint8List pictureBlob, BusinessPage businessPage, double price, Currency currency, String description, {int id}) {
    this._id = id;
    this._name = name;
    this._category = category;
    this._type = type;
    this._pictureBlob = pictureBlob;
    this._businessPage = businessPage;
    this._price = price;
    this._currency = currency;
    this._description = description;
  }

  // region Getters

  ProductType get type{
    return this._type;
  }

  int get id {
    return this._id;
  }

  String get name {
    return this._name;
  }

  ProductCategory get category {
    return this._category;
  }

  Uint8List get pictureBlob {
    return this._pictureBlob;
  }

  bool get isNewProduct {
    return _id == null;
  }

  BusinessPage get businessPage {
    return this._businessPage;
  }

  double get price {
    return this._price;
  }

  Currency get currency {
    return this._currency;
  }

  String get description {
    return this._description;
  }
  String get priceStr {
    if (price == 0) return "free";

    NumberFormat fmt = NumberFormat('#,###.##');
    switch (currency) {
      case Currency.KRW:
        return '${fmt.format(price)} ₩';
      case Currency.USD:
        return '${fmt.format(price)} \$';
      case Currency.RUB:
        return '${fmt.format(price)} ₽';
      case Currency.UZS:
        return '${fmt.format(price)} Soum';
      default:
        return '[N/A]';
    }
  }

// endregion
}
