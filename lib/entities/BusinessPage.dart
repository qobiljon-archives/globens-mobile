class BusinessPage {
  BusinessPage._(int id, String title, String type, List<int> pictureBlob, String role) {
    this._id = id;
    this._title = title;
    this._type = type;
    this._pictureBlob = pictureBlob;
    this._role = role;
  }

  BusinessPage.create(String title, List<int> pictureBlob, {int id, String type, String role}) {
    this._id = id;
    this._title = title;
    this._type = type;
    this._pictureBlob = pictureBlob;
    this._role = role;
  }

  int _id;
  String _title;
  String _type;
  List<int> _pictureBlob;
  String _role;

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  String get type {
    return _type;
  }

  List<int> get pictureBlob {
    return _pictureBlob;
  }

  String get role {
    return _role;
  }

  bool get isNewBusinessPage {
    return id == null;
  }
}
