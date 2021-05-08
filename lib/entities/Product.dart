import 'dart:convert';

import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:intl/intl.dart';
import 'BusinessPage.dart';

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
  ProductDeliveryType _productType;
  ProductCategory _category;
  List<int> _pictureBlob;
  BusinessPage _businessPage;
  double _price;
  double _stars;
  int _reviewsCount;
  Currency _currency;
  String _description;
  Map<String, dynamic> _contents;
  bool _published;

  // endregion

  Product.create(String name, ProductDeliveryType productType, ProductCategory category, List<int> pictureBlob, BusinessPage businessPage, double price, Currency currency, String description, Map<String, dynamic> contents, {int id, double stars, int reviewsCount, bool published}) {
    this._id = id;
    this._name = name;
    this._productType = productType;
    this._category = category;
    this._pictureBlob = pictureBlob;
    this._businessPage = businessPage;
    this._price = price;
    this._stars = stars;
    this._reviewsCount = reviewsCount;
    this._currency = currency;
    this._description = description;
    this._contents = contents;
    this._published = published;
  }

  // region Getters

  int get id {
    return this._id;
  }

  String get name {
    return this._name;
  }

  ProductDeliveryType get productType {
    return this._productType;
  }

  ProductCategory get category {
    return this._category;
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

  double get stars {
    return this._stars;
  }

  int get reviewsCount {
    return this._reviewsCount;
  }

  Currency get currency {
    return this._currency;
  }

  String get description {
    return this._description;
  }

  String get priceStr {
    return price2string(price, currency);
  }

  Map<String, dynamic> get contents {
    return this._contents;
  }

  String get contentsJson {
    return jsonEncode(this._contents);
  }

  bool get published => _published;

  // endregion

  static String price2string(double price, Currency currency) {
    if (price == 0) return "free item";

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
}

class Content {
  // region Variables
  int _id;
  String _title;
  String _fileId;
  String _url;

  // endregion

  Content.create(String title, String fileId, String url, {int id}) {
    this._id = id;
    this._title = title;
    this._fileId = fileId;
    this._url = url;
  }

  // region Getters

  int get id {
    return this._id;
  }

  String get title {
    return this._title;
  }

  String get fileId {
    return this._fileId;
  }

  String get url {
    return this._url;
  }
// endregion
}
