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

  List<String> get examples => _examples;

  set examples(List<String> value) {
    _examples = value;
  }

  Uint8List get pictureBlob => _pictureBlob;

  set pictureBlob(Uint8List value) {
    _pictureBlob = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

// region Getters

// endregion
}
