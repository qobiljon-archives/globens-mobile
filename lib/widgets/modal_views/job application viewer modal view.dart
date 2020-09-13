import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

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
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget('Application form for "${widget.job.title}"'),
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
            onPressed: () => _onSubmitApplicationFormPressed(context, widget.job),
            child: Text("Submit application form"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Expanded(
              child: Container(),
            ),
          )
        ],
      );
    else
      // existing job application (read mode)
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget('Application form for "${widget.job.title}"'),
          Text('Submitted by : ${applicantUser == null ? "[Loading]" : applicantUser.isMe ? "you" : "${applicantUser.name} (${applicantUser.email})"}'),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Expanded(
              child: Container(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(child: Text("Approve"), onPressed: () => _onApproveButtonPressed(context)),
              RaisedButton(
                child: Text("Decline"),
                onPressed: () => _onDeclineButtonPressed(context),
              ),
            ],
          )
        ],
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

  void _onApproveButtonPressed(BuildContext context) async {
    bool success = await grpcApproveJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast("Success");
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onDeclineButtonPressed(BuildContext context) async {
    bool success = await grpcDeclineJobApplication(AppUser.sessionKey, widget.jobApplication);
    if (success) {
      await toast("Success");
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
