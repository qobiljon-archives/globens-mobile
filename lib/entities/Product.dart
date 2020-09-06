import 'dart:typed_data';

class Product {
  Product.create(String name, Uint8List pictureBlob, {int id}) {
    this._name = name;
    this._pictureBlob = pictureBlob;
  }

  int _id;
  String _name;
  List<int> _pictureBlob;

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  List<int> get pictureBlob {
    return _pictureBlob;
  }

  bool get isNewProduct {
    return _id == null;
  }
}
