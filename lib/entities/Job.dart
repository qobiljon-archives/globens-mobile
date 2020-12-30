class Job {
  // region Constants
  static const String BUSINESS_OWNER_ROLE = 'business owner';
  static const String EMPLOYEE_ROLE = 'employee';
  static const String INDIVIDUAL_ENTREPRENEUR_ROLE = 'individual entrepreneur';

  static const String CREATE_ACTION = 'create';
  static const String UNCREATE_ACTION = 'uncreate';

  // endregion

  // region Variables
  int _id;
  String _description;
  String _responsibilities;
  String _role;
  String _title;
  int _hiredUserId;

  // endregion

  Job.create(String title, {int id, String role, int hiredUserId, String description, String responsibilities}) {
    this._title = title;
    this._id = id;
    this._role = role;
    this._hiredUserId = hiredUserId;
    this._responsibilities = _responsibilities;
    this._description = description;
  }

  // region Getters
  String get description {
    return _description;
  }

  String get responsibilities {
    return _responsibilities;
  }

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
// endregion
}
