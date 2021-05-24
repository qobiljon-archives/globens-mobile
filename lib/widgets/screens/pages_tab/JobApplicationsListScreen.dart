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

    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Flexible(child: Text(Locale.get("Candidates for ${Locale.REPLACE}", _job == null ? "" : _job.title.toLowerCase()), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white)))),
      body: ListView.builder(
        itemCount: _jobApplications.length,
        itemBuilder: (BuildContext context, index) => _getListViewItems(context, index),
      ),
    );
  }

  Widget _getListViewItems(BuildContext context, int index) {
    // job applications section
    if (_jobApplications == null)
      return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
    else if (_jobApplications.length > 0)
      return _buildVacancyApplicationItem(context, index == 0, _jobApplications[index]);
    else
      return Container(); // empty job applications
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

  void _onJobApplicationPressed(JobApplication jobApplication) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => JobApplicationViewerModalView(jobApplication));
    _updateDynamicPart();
  }
}
