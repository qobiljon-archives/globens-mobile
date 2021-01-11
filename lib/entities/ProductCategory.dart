import 'dart:typed_data';

class ProductCategory {
  // region Variables
  int _id;
  String _name;
  Uint8List _pictureBlob;
  List<String> _examples;

  // endregion

  ProductCategory.create(int id, String name, List<String> examples, Uint8List pictureBlob) {
    this._id = id;
    this._name = name;
    this._examples = examples;
    this._pictureBlob = pictureBlob;
  }

  // region Getters
  int get id {
    return this._id;
  }

  String get name {
    return _name;
  }

  List<String> get examples {
    return this._examples;
  }

  Uint8List get pictureBlob {
    return this._pictureBlob;
  }
// endregion
}
