import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'dart:typed_data';

class JobApplication {
  // region Variables
  int _id;
  GlobensUser _applicant;
  Job _job;
  String _message;
  Uint8List _content;

  // endregion

  JobApplication.create(String message, Uint8List content, Job job, {int id, GlobensUser applicant}) {
    this._id = id;
    this._job = job;
    this._applicant = applicant;
    this._message = message;
    this._content = content;
  }

  // region Getters
  int get id {
    return _id;
  }

  Job get job {
    return _job;
  }

  GlobensUser get applicant {
    return _applicant;
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
