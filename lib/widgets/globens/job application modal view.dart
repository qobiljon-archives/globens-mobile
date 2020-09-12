import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/entities/VacancyApplication.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

class JobApplicationEditorModalView {
  static TextEditingController _applicantMessage = TextEditingController();

  static Widget getModalView(Job job, BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              child: Text(
                "Application Form",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "(Position: ${job.title})",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                maxLines: 1,
                controller: _applicantMessage,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "message",
                  hintText: "message",
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: RaisedButton(
                onPressed: () => _onSubmitButtonPressed(job, context),
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void _onSubmitButtonPressed(Job job, BuildContext context) {
    if (_applicantMessage.text.length < 5)
      toast("messsage can't be less than 5 characters:)");
    else
      grpcCreateJobApplication(AppUser.sessionKey, job.id, JobApplication.create(_applicantMessage.text)).then((success) {
        if (success) {
          toast("submitted!");
          Navigator.pop(context);
        } else {
          toast("not submitted!");
        }
      });
  }
}
