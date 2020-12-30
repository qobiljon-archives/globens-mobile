class JobApplication {
  // region Variables
  int _id;
  int _applicantId;
  String _message;
  // endregion

  JobApplication.create(String message, {int id, int applicantId}) {
    this._message = message;
    this._id = id;
    this._applicantId = applicantId;
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

  bool get isNewJobApplication {
    return _id == null;
  }
  // endregion
}
