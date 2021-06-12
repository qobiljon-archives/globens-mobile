import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:intl/intl.dart';
import 'BusinessPage.dart';
import 'dart:convert';

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
  String _dynamicLink;
  bool _published;

  // endregion

  Product.create(String name, ProductDeliveryType productType, ProductCategory category, List<int> pictureBlob, BusinessPage businessPage, double price, Currency currency, String description, Map<String, dynamic> contents, String dynamicLink, {int id, double stars, int reviewsCount, bool published}) {
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
    this._dynamicLink = dynamicLink;
    this._published = published;
  }

  // region Getters

  int get id => _id;

  set id(newId) => _id = newId;

  String get name => _name;

  ProductDeliveryType get productType => _productType;

  ProductCategory get category => _category;

  List<int> get pictureBlob => _pictureBlob;

  bool get isNewProduct => _id == null;

  BusinessPage get businessPage => _businessPage;

  double get price => _price;

  double get stars => _stars;

  int get reviewsCount => _reviewsCount;

  Currency get currency => _currency;

  String get description => _description;

  String get priceStr => price2string(price, currency);

  Map<String, dynamic> get contents => _contents;

  String get contentsJson => jsonEncode(this._contents);

  String get dynamicLink => _dynamicLink;

  set dynamicLink(newDynamicLink) => _dynamicLink = newDynamicLink;

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
