import 'package:globens_flutter_client/widgets/modal_views/JobApplicationViewerModalView.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobApplicationsListScreen extends StatefulWidget {
  @override
  _JobApplicationsListScreenState createState() => _JobApplicationsListScreenState();
}

class _JobApplicationsListScreenState extends State<JobApplicationsListScreen> {
  List<Widget> _header = [];
  List<JobApplication> _jobApplications = [];
  List<Widget> _footer = [];
  BusinessPage _businessPage;
  Job _job;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 0. parsing arguments passed to this route (business page)
    Map args = ModalRoute.of(context).settings.arguments as Map;
    _job = args['job'] as Job;
    _businessPage = args['businessPage'] as BusinessPage;
    assert(_businessPage.role == Job.BUSINESS_OWNER_ROLE);

    // 1. static part : set up common part of header and footer
    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          getTitleWidget(shorten(_job.title, 20, ellipsize: true)),
        ],
      ),
    ];

    // 2. dynamic part : change footer according to user's role in business page
    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.blueAccent,
                ),
            itemCount: _header.length + _jobApplications.length + _footer.length,
            itemBuilder: (BuildContext context, index) => _getListViewItems(context, index)));
  }

  Widget _getListViewItems(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _jobApplications.length)
      return _footer[index - _footer.length - _jobApplications.length];
    else
      return _buildVacancyApplicationItem(context, index - _header.length);
  }

  Widget _buildVacancyApplicationItem(BuildContext context, int index) {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: GestureDetector(
            onTap: () => _onJobApplicationPressed(context, _jobApplications[index], index),
            child: Text(
              "${_jobApplications[index].message}",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Row(
          children: [
            RaisedButton(child: Text("Approve"), onPressed: () => _onApproveButtonPressed(context, index)),
            RaisedButton(
              child: Text("Decline"),
              onPressed: () => _onDeclineButtonPressed(context, index),
            ),
          ],
        )
      ],
    );

    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitleWidget("Job applications", textColor: Colors.black),
          row,
        ],
      );
    } else
      return row;
  }

  void _updateDynamicPart() async {
    grpcFetchJobApplications(AppUser.sessionKey, _job).then((tuple) async {
      bool success = tuple.item1;
      List<JobApplication> jobApplications = tuple.item2;
      if (success)
        setState(() {
          _jobApplications = jobApplications;
        });
      else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(const Duration(seconds: 3), onTimeout: () {
      print("timeout");
      //TODO: the future should be cancelled automatically after timeout: e.g -> StreamSubscription
    });
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onJobApplicationPressed(BuildContext context, JobApplication vacancyApplication, int index) async {
    await showModalBottomSheet(context: context, builder: (context) => JobApplicationViewerModalView(job: _job, jobApplication: _jobApplications[index]));
    _updateDynamicPart();
  }

  void _onApproveButtonPressed(BuildContext context, int index) async {
    bool success = await grpcApproveJobApplication(AppUser.sessionKey, _jobApplications[index]);
    if (success) {
      await toast("Success");
      _updateDynamicPart();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onDeclineButtonPressed(BuildContext context, int index) async {
    bool success = await grpcDeclineJobApplication(AppUser.sessionKey, _jobApplications[index]);
    if (success) {
      await toast("Success");
      _updateDynamicPart();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
