class JobApplication {
  JobApplication.create(String message, {int id}) {
    this._message = message;
    this._id = id;
  }

  int _id;
  String _message;

  int get id {
    return _id;
  }

  String get message {
    return _message;
  }

  bool get isNewVacancyApplication {
    return _id == null;
  }
}
