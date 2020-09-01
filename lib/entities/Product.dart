

class Product {
  String _name;
  String _imgUri;

  Product._(String name, String imgUri) {
    this._name = name;
    this._imgUri = imgUri;
  }

  Product.create(String name, String imgUri) {
    this._name = name;
    this._imgUri = imgUri;
  }

  String get name {
    return _name;
  }

  String get imgUri {
    return _imgUri;
  }
}
