import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'dart:convert';

class JobApplication {
  // region Variables
  int _id;
  GlobensUser _applicant;
  Job _job;
  String _message;
  Map<String, dynamic> _contents;

  // endregion

  JobApplication.create(String message, Map<String, dynamic> contents, Job job, {int id, GlobensUser applicant}) {
    this._id = id;
    this._job = job;
    this._applicant = applicant;
    this._message = message;
    this._contents = contents;
  }

  // region Getters
  int get id => _id;

  Job get job => _job;

  GlobensUser get applicant => _applicant;

  String get message => _message;

  Map<String, dynamic> get contents => _contents;

  String get contentsJson => jsonEncode(this._contents);

  bool get isNewJobApplication => _id == null;
// endregion
}
