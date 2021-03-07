import 'dart:typed_data';

class JobApplication {
  // region Variables
  int _id;
  int _applicantId;
  String _message;
  Uint8List _content;

  // endregion

  JobApplication.create(String message, Uint8List content, {int id, int applicantId}) {
    this._id = id;
    this._applicantId = applicantId;
    this._message = message;
    this._content = content;
  }

  // region Getters
  int get id {
    return _id;
  }

  int get applicantId {
    return _applicantId;
  }

  String get message {
    return _message;
  }

  Uint8List get content {
    return this._content;
  }

  bool get isNewJobApplication {
    return _id == null;
  }
// endregion
}
