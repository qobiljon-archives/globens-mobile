import 'package:globens_flutter_client/widgets/modal_views/JobApplicationViewerModalView.dart';
import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Map args = ModalRoute.of(context).settings.arguments as Map;
    _job = args['job'] as Job;
    _businessPage = args['businessPage'] as BusinessPage;
    assert(_businessPage.role == Job.BUSINESS_OWNER_ROLE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get("Candidates for ${Locale.REPLACE}", _job == null ? "" : _job.title.toLowerCase()), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(
          color: Colors.blue,
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle)
              body = Text("Pull up to load more");
            else if (mode == LoadStatus.loading)
              body = Text("Loading");
            else if (mode == LoadStatus.failed)
              body = Text("Load Failed! Click retry!");
            else if (mode == LoadStatus.canLoading)
              body = Text("release to load more");
            else
              body = Text("No more Data");
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _jobApplications.length,
          itemBuilder: (BuildContext context, index) => _getListViewItems(context, index),
        ),
      ),
    );
  }

  void _onRefresh() async {
    var res = await grpcFetchJobApplications(AppUser.sessionKey, _job);
    if (res.item1 && mounted) {
      setState(() {
        _jobApplications = res.item2;
      });
    }
    _refreshController.refreshCompleted();
  }

  Widget _getListViewItems(BuildContext context, int index) {
    // job applications section
    if (_jobApplications == null)
      return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
    else if (_jobApplications.length > 0)
      return _buildJobApplicationItem(context, index == 0, _jobApplications[index]);
    else
      return Container(); // empty job applications
  }

  Widget _buildJobApplicationItem(BuildContext context, bool firstElement, JobApplication jobApplication) {
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

  void _onJobApplicationPressed(JobApplication jobApplication) async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => JobApplicationViewerModalView(jobApplication));
    _refreshController.requestRefresh();
  }
}
