import 'AppUser.dart';

class GlobensUser {
  // region Variables
  int _id;
  String _email;
  String _googleDriveEmail;
  String _name;
  String _picture;
  List<int> _pictureBlob;
  String _countryCode;

  // endregion

  GlobensUser.create(int id, String email, String googleDriveEmail, String name, String picture, List<int> pictureBlob, String countryCode) {
    this._id = id;
    this._email = email;
    this._googleDriveEmail = googleDriveEmail;
    this._name = name;
    this._picture = picture;
    this._pictureBlob = pictureBlob;
    this._countryCode = countryCode;
  }

  // region Getters
  int get id => _id;

  String get email => _email;

  String get googleDriveEmail => _googleDriveEmail;

  String get name => _name;

  String get picture => _picture;

  List<int> get pictureBlob => _pictureBlob;

  bool get isMe => _id == AppUser.id;

  String get countryCode => _countryCode;
// endregion
}
