import 'dart:typed_data';

class BusinessPage {
  // region constants
  static const String SMALL_BUSINESS_TYPE = 'small business';
  static const String LARGE_BUSINESS_TYPE = 'large business';

  // endregion

  // region variables
  static Map<int, BusinessPage> instances = Map<int, BusinessPage>();
  int _id;
  String _title;
  String _type;
  Uint8List _pictureBlob;
  String _role;
  String _countryCode;

  // endregion

  BusinessPage.create(String title, Uint8List pictureBlob, String countryCode, {int id, String type, String role}) {
    this._id = id;
    this._title = title;
    this._pictureBlob = pictureBlob;
    this._countryCode = countryCode;
    this._type = type;
    this._role = role;
  }

  // region getters
  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  String get type {
    return _type;
  }

  Uint8List get pictureBlob {
    return _pictureBlob;
  }

  String get role {
    return _role;
  }

  bool get isNewBusinessPage {
    return _id == null;
  }

  String get countryCode => _countryCode;
// endregion
}
