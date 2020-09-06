class Job {
  Job.create(String title, {int id, int hiredUserId}) {
    this._title = title;
  }

  int _id;
  String _title;
  int _hiredUserId;

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  int get hiredUserId {
    return _hiredUserId;
  }

  bool get newlyCreated {
    return _id == null;
  }

  bool get isVacant {
    return _hiredUserId == null;
  }
}
