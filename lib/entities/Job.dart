class Job {
  Job.create(String title, {int id, String role, int hiredUserId}) {
    this._title = title;
    this._id = id;
    this._role = role;
    this._hiredUserId = hiredUserId;
  }

  int _id;
  String _role;
  String _title;
  int _hiredUserId;

  String get title {
    return _title;
  }

  int get id {
    return _id;
  }

  String get role {
    return _role;
  }

  int get hiredUserId {
    return _hiredUserId;
  }

  bool get newlyCreated {
    return _id == null;
  }

  bool get isVacant {
    return _hiredUserId == -1;
  }
}
