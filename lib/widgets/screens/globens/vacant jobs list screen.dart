import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20application%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class VacantJobsListScreen extends StatefulWidget {
  @override
  _VacantJobsListScreenState createState() => _VacantJobsListScreenState();
}

class _VacantJobsListScreenState extends State<VacantJobsListScreen> {
  List<Job> _vacantJobs = [];
  List<Widget> _header = [];

  @override
  void initState() {
    super.initState();

    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          getTitleWidget("Vacancies"),
        ],
      ),
    ];

    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.blueAccent,
            );
          },
          itemCount: _header.length + _vacantJobs.length,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index == 0)
      return _header[index];
    else {
      index -= _header.length;
      return _buildVacancyItem(context, index);
    }
  }

  Widget _buildVacancyItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
              child: Text(
                "${_vacantJobs[index].title}",
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () => _openVacancyDetails(context, index)),
        ),
        RaisedButton(
          onPressed: () => _onApplyButtonPressed(context, index),
          child: Text("Apply"),
        ),
      ],
    );
  }

  void _updateDynamicPart() async {
    grpcFetchBusinessPageVacancies(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<Job> vacantJobs = tuple.item2;
      if (success) {
        setState(() {
          _vacantJobs = vacantJobs;
        });
      } else
        AppUser.signOut().then((value) => Navigator.of(context).pushReplacementNamed('/'));
    });
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onApplyButtonPressed(BuildContext context, int index) async {
    Tuple2<bool, List<JobApplication>> res = await grpcFetchJobApplications(AppUser.sessionKey, _vacantJobs[index]);
    bool success = res.item1;
    List<JobApplication> jobApplications = res.item2;

    if (success) {
      bool alreadyApplied = false;
      for (JobApplication jobApplication in jobApplications)
        if (jobApplication.applicantId == AppUser.id) {
          alreadyApplied = true;
          break;
        }

      if (alreadyApplied)
        toast("You have already applied for this position!");
      else {
        await showModalBottomSheet(context: context, builder: (context) => JobApplicationViewerModalView(job: _vacantJobs[index]));
        _updateDynamicPart();
      }
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _openVacancyDetails(BuildContext context, index) async {
    await showModalBottomSheet(context: context, builder: (context) => JobViewerModalView(job: _vacantJobs[index]));
    grpcFetchBusinessPageVacancies(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<Job> jobs = tuple.item2;
      if (success) {
        setState(() {
          _vacantJobs = jobs;
        });
      } else
        AppUser.signOut().then((value) => Navigator.of(context).pushReplacementNamed('/'));
    });
  }
}
