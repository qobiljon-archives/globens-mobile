import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/Content.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'dart:convert';

class JobApplication {
  // region Variables
  int _id;
  GlobensUser _applicant;
  Job _job;
  String _message;
  List<Content> _contents;

  // endregion

  JobApplication.create(String message, List<Content> contents, Job job, {int id, GlobensUser applicant}) {
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

  List<Content> get contents => _contents;

  String get contentsJson => jsonEncode({'ids': List.generate(_contents.length, (index) => _contents[index].id)});

  bool get isNewJobApplication => _id == null;
// endregion
}
