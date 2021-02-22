import 'AppUser.dart';

class GlobensUser {
  // region Variables
  int _id;
  String _email;
  String _name;
  String _picture;
  List<int> _pictureBlob;

  // endregion

  GlobensUser.create(int id, String email, String name, String picture, List<int> pictureBlob) {
    this._id = id;
    this._email = email;
    this._name = name;
    this._picture = picture;
    this._pictureBlob = pictureBlob;
  }

  // region Getters
  int get id {
    return _id;
  }

  String get email {
    return _email;
  }

  String get name {
    return _name;
  }

  String get picture {
    return _picture;
  }

  List<int> get pictureBlob {
    return _pictureBlob;
  }

  bool get isMe {
    return _id == AppUser.id;
  }

// endregion
}
