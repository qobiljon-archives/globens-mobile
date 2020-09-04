import 'dart:typed_data';

class Vacancy {
  Vacancy._(int id, String title, Uint8List pictureBlob) {
    this._id = id;
    this._title = title;
  }

  Vacancy.create(String name) {
    this._title = name;
  }

  int _id;
  String _title;

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  bool get isNewProduct {
    return _id == null;
  }
}
