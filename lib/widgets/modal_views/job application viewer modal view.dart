import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

class JobApplicationViewerModalView {
  static final TextEditingController _applicantMessage = TextEditingController();

  static Widget getModalView(Job job, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getTitleWidget('Application form for "${job.title}"'),
        TextField(
          maxLines: 1,
          controller: _applicantMessage,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: "message",
            hintText: "message",
          ),
        ),
        RaisedButton(
          onPressed: () => _onSubmitButtonPressed(job, context),
          child: Text("Submit"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Expanded(
            child: Container(),
          ),
        )
      ],
    );
  }

  static Future<void> _onSubmitButtonPressed(Job job, BuildContext context) async {
    if (_applicantMessage.text.length < 5)
      await toast("Message can't be less than 5 characters:)");
    else {
      bool success = await grpcCreateJobApplication(AppUser.sessionKey, job.id, JobApplication.create(_applicantMessage.text));
      if (success) {
        await toast("Success");
        Navigator.of(context).pop();
      } else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }
  }
}
