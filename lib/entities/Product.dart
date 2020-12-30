import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';

import 'BusinessPage.dart';
import 'dart:typed_data';

class Product {
  // region constants
  static const String CREATE_ACTION = 'create';
  static const String UNCREATE_ACTION = 'uncreate';
  static const String PUBLISH_ACTION = 'publish';
  static const String UNPUBLISH_ACTION = 'unpublish';

  // endregion

  // region variables
  static Map<int, Product> _instances = Map<int, Product>();
  int _id;
  String _name;
  List<int> _pictureBlob;
  BusinessPage _businessPage;
  double _price;
  Currency _currency;

  // endregion

  Product.create(String name, Uint8List pictureBlob, BusinessPage businessPage, double price, Currency currency, {int id}) {
    this._id = id;
    this._name = name;
    this._pictureBlob = pictureBlob;
    this._businessPage = businessPage;
    this._price = price;
    this._currency = currency;
  }

  // region getters
  int get id {
    return this._id;
  }

  String get name {
    return this._name;
  }

  List<int> get pictureBlob {
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

  String get priceStr {
    switch (currency) {
      case Currency.KRW:
        return '$price ₩';
      case Currency.USD:
        return '\$';
      default:
        return '[N/A]';
    }
    return "${price}";
  }

// endregion
}
