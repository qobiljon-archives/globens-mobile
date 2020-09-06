class JobApplication {
  JobApplication.create(String title, {int id}) {
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
