import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';

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
  BusinessPage _businessPage;
  String _role;
  String _title;
  GlobensUser _hiredUser;

  // endregion

  Job.create(String title, {int id, BusinessPage businessPage, String role, GlobensUser hiredUser}) {
    this._title = title;
    this._id = id;
    this._businessPage = businessPage;
    this._role = role;
    this._hiredUser = hiredUser;
  }

  // region Getters
  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  BusinessPage get businessPage {
    return _businessPage;
  }

  String get role {
    return _role;
  }

  GlobensUser get hiredUser {
    return _hiredUser;
  }

  bool get newlyCreated {
    return _id == null;
  }

  bool get isVacant {
    return _hiredUser == null;
  }

// endregion
}
