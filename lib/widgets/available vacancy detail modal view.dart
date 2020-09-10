import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/entities/VacancyApplication.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

class AvailableVacancyDetails extends StatefulWidget {
  Job job;

  AvailableVacancyDetails({this.job});

  @override
  _AvavilableVacaniesDetailsState createState() => _AvavilableVacaniesDetailsState();
}

class _AvavilableVacaniesDetailsState extends State<AvailableVacancyDetails> {
  final applicantMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                "(Position: ${widget.job.title})",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                maxLines: 1,
                controller: applicantMessage,
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
                onPressed: onSubmitButtonPressed,
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSubmitButtonPressed() {
    if (applicantMessage.text.length < 5)
      toast("messsage can't be less than 5 characters:)");
    else
      grpcCreateJobApplication(AppUser.sessionKey, widget.job.id, JobApplication.create(applicantMessage.text)).then((success) {
        if (success) {
          toast("submitted!");
        } else {
          toast("not submitted!");
        }
      });
  }
}
