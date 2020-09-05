class Vacancy {
  Vacancy._(int id, String title) {
    this._id = id;
    this._title = title;
  }

  Vacancy.create(String title) {
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

  bool get isNewVacancy {
    return _id == null;
  }
}
