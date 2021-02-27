import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobApplicationViewerModalView extends StatefulWidget {
  final Job job;
  final JobApplication jobApplication;
  final BusinessPage businessPage;

  JobApplicationViewerModalView({this.job, this.jobApplication, this.businessPage});

  @override
  State<StatefulWidget> createState() => _JobApplicationViewerModalViewState();
}

class _JobApplicationViewerModalViewState extends State<JobApplicationViewerModalView> {
  final TextEditingController _applicantMessage = TextEditingController();
  GlobensUser applicantUser;

  @override
  void initState() {
    super.initState();

    if (widget.jobApplication != null) _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.jobApplication == null)
      // new job application (write mode)
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            getTitleWidget(Locale.get('Application form for "${Locale.REPLACE}"', widget.job.title)),
            TextField(
              maxLines: 1,
              controller: _applicantMessage,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: Locale.get("message"),
                hintText: Locale.get("message"),
              ),
            ),
            RaisedButton(
              onPressed: () => _onSubmitApplicationFormPressed(context, widget.job),
              child: Text(Locale.get("Submit application form")),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Expanded(
                child: Container(),
              ),
            )
          ],
        ),
      );
    else
      // existing job application (read mode)
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getTitleWidget(Locale.get('Application form for "${Locale.REPLACE}"', widget.job.title)),
                Text(Locale.get('Submitted by : ${Locale.REPLACE}', applicantUser == null ? Locale.get("Loading") : applicantUser.isMe ? Locale.get("you") : "${applicantUser.name} (${applicantUser.email})")),
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Expanded(
                    child: Container(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(child: Text(Locale.get("Approve")), onPressed: () => _onApproveButtonPressed(context)),
                    RaisedButton(
                      child: Text(Locale.get("Decline")),
                      onPressed: () => _onDeclineButtonPressed(context),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
  }

  void _updateDynamicPart() async {
    grpcFetchUserDetails(AppUser.sessionKey, widget.jobApplication.applicantId).then((res) async {
      bool success = res.item1;
      GlobensUser user = res.item2;
      if (success) {
        setState(() {
          applicantUser = user;
        });
      } else {
        await AppUser.signOut();
        Navigator.of(context).pushReplacementNamed('/');
      }
    });
  }

  void _onSubmitApplicationFormPressed(BuildContext context, Job job) async {
    if (_applicantMessage.text.length < 5)
      await toast(Locale.get("Message can't be less than 5 characters."));
    else {
      bool success = await grpcCreateJobApplication(AppUser.sessionKey, job, JobApplication.create(_applicantMessage.text));
      if (success) {
        await toast(Locale.get("Submitted"));
        Navigator.of(context).pop();
      } else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }
  }

  void _onApproveButtonPressed(BuildContext context) async {
    bool success = await grpcApproveJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast(Locale.get("Success"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onDeclineButtonPressed(BuildContext context) async {
    bool success = await grpcDeclineJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast(Locale.get("Success"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
