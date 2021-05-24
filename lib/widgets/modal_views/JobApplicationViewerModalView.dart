import 'package:globens_flutter_client/widgets/screens/ContentViewerScreen.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/Content.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class JobApplicationViewerModalView extends StatefulWidget {
  final JobApplication _jobApplication;

  JobApplicationViewerModalView(this._jobApplication);

  @override
  State<StatefulWidget> createState() => _JobApplicationViewerModalViewState();
}

class _JobApplicationViewerModalViewState extends State<JobApplicationViewerModalView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(240, 242, 245, 1),
      child: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          children: [
            Container(
              margin: EdgeInsets.only(right: 30.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _onBackButtonPressed),
                getTitleWidget(Locale.get("Candidate details"), textColor: Colors.black, margin: EdgeInsets.zero),
              ]),
            ),
            getSectionSplitter(Locale.get('Message')),
            Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  shorten(widget._jobApplication.message, 50, ellipsize: true),
                  maxLines: 10,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                ),
              ),
            ),
            if (widget._jobApplication.contents.length > 0) getSectionSplitter(Locale.get('Attached files')),
            if (widget._jobApplication.contents.length > 0)
              Column(
                children: widget._jobApplication.contents
                    .map((content) => GestureDetector(
                    onTap: () => _onContentPressed(content),
                    child: Card(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10, bottom: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              SizedBox(width: 10.0, height: 10.0),
                              Icon(getFileTypeIcon(content.title), color: Colors.black87, size: 30.0),
                              SizedBox(width: 10.0, height: 10.0),
                              Expanded(child: Text(RegExp(r'^(.+/)?(.+)$').firstMatch(content.title).group(2), overflow: TextOverflow.ellipsis)),
                            ])))))
                    .toList(),
              ),
            if (widget._jobApplication.job.businessPage.role == Job.BUSINESS_OWNER_ROLE)
              Container(
                margin: EdgeInsets.only(top: 50.0),
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
      ),
    );
  }

  void _onApproveButtonPressed() async {
    bool success = await grpcApproveJobApplication(AppUser.sessionKey, widget._jobApplication);
    if (success) {
      await toast(Locale.get("Success"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onDeclineButtonPressed() async {
    bool success = await grpcDeclineJobApplication(AppUser.sessionKey, widget._jobApplication);
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

  void _onContentPressed(Content content) async {
    await Navigator.pushNamed(context, ContentViewerScreen.route_name, arguments: content);
  }
}
