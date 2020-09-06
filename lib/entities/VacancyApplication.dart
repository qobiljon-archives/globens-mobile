class JobApplication {
  JobApplication._(int id, String title) {
    this._id = id;
    this._title = title;
  }

  JobApplication.create(String title) {
    this._title = title;
  }

  int _id;
  String _title;

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  bool get isNewVacancyApplication {
    return _id == null;
  }
}
