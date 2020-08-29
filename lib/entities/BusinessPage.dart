class BusinessPage {
  BusinessPage(int id, String title, String type, List<int> pictureBlob, String role) {
    _id = id;
    _title = title;
    _type = type;
    _pictureBlob = pictureBlob;
    _role = role;
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
}
