class Product {
  String _name;
  List<int> _pictureBlob;

  Product._(String name, List<int> imgUri) {
    this._name = name;
    this._pictureBlob = _pictureBlob;
  }

  Product.create(String name, List<int> imgUri) {
    this._name = name;
    this._pictureBlob = _pictureBlob;
  }

  String get name {
    return _name;
  }

  List<int> get imgUri {
    return _pictureBlob;
  }
}
