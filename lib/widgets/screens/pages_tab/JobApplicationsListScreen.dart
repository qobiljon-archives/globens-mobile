import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globens_flutter_client/widgets/modal_views/JobApplicationViewerModalView.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class JobApplicationsListScreen extends StatefulWidget {
  static const String route_name = '/business_page_details/job_applications_list';

  @override
  _JobApplicationsListScreenState createState() => _JobApplicationsListScreenState();
}

class _JobApplicationsListScreenState extends State<JobApplicationsListScreen> {
  List<Widget> _header;
  BusinessPage _businessPage;
  Job _job;
  List<JobApplication> _jobApplications = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Map args = ModalRoute.of(context).settings.arguments as Map;
    _job = args['job'] as Job;
    _businessPage = args['businessPage'] as BusinessPage;
    assert(_businessPage.role == Job.BUSINESS_OWNER_ROLE);

    _header = [
      Row(children: [
        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _onBackButtonPressed),
        getTitleWidget(Locale.get("Job applicants"), textColor: Colors.black),
      ]),
      getSectionSplitter(Locale.get("Position : ${Locale.REPLACE}", shorten(_job.title, 20, ellipsize: true))),
    ];

    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _header.length + _jobApplications.length,
        itemBuilder: (BuildContext context, index) => _getListViewItems(context, index),
      ),
    );
  }

  Widget _getListViewItems(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else {
      // job applications section
      if (_jobApplications == null)
        return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
      else if (_jobApplications.length > 0)
        return _buildVacancyApplicationItem(context, index - _header.length == 0, _jobApplications[index - _header.length]);
      else
        return Container(); // empty job applications
    }
  }

  Widget _buildVacancyApplicationItem(BuildContext context, bool firstElement, JobApplication jobApplication) {
    return InkWell(
        onTap: () => _onJobApplicationPressed(jobApplication),
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: EdgeInsets.all(10.0), child: CircleAvatar(radius: 20.0, backgroundImage: NetworkImage(jobApplication.applicant.picture))),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shorten(jobApplication.applicant.name, 28, ellipsize: true), style: TextStyle(fontSize: 20.0)),
                    Text('"${shorten(jobApplication.message, 50, ellipsize: true)}"', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic)),
                  ],
                ),
              )
            ],
          ),
        ));
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
    });
  }

  void _onBackButtonPressed() {
    Navigator.pop(context);
  }

  void _onJobApplicationPressed(JobApplication jobApplication) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => JobApplicationViewerModalView(jobApplication));
    _updateDynamicPart();
  }
}
