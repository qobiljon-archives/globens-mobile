import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class JobApplicationViewerModalView extends StatefulWidget {
  final JobApplication jobApplication;

  JobApplicationViewerModalView(this.jobApplication);

  @override
  State<StatefulWidget> createState() => _JobApplicationViewerModalViewState();
}

class _JobApplicationViewerModalViewState extends State<JobApplicationViewerModalView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(right: 30.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _onBackButtonPressed),
              getTitleWidget(Locale.get("Applicant details"), textColor: Colors.black, margin: EdgeInsets.zero),
            ]),
          ),
          Card(
            margin: EdgeInsets.only(top: 10.0),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                shorten(widget.jobApplication.message, 50, ellipsize: true),
                maxLines: 10,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
              ),
            ),
          ),
          if (widget.jobApplication.job.businessPage.role == Job.BUSINESS_OWNER_ROLE)
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton.icon(onPressed: _onApproveButtonPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.check_circle_sharp, color: Colors.white), label: Text(Locale.get("Approve"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  RaisedButton.icon(onPressed: _onDeclineButtonPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.do_not_disturb_on, color: Colors.white), label: Text(Locale.get("Reject"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ],
              ),
            )
        ],
      ),
    );
  }

  void _onApproveButtonPressed() async {
    bool success = await grpcApproveJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast(Locale.get("Success"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onDeclineButtonPressed() async {
    bool success = await grpcDeclineJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast(Locale.get("Success"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }
}
