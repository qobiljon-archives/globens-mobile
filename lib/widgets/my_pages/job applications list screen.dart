import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/VacancyApplication.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobApplicationsListScreen extends StatefulWidget {

  const JobApplicationsListScreen();

  @override
  _JobApplicationsListScreenState createState() => _JobApplicationsListScreenState();
}

class _JobApplicationsListScreenState extends State<JobApplicationsListScreen> {
  List<Widget> _header = [];
  List<JobApplication> _jobApplications = [];
  List<Widget> _footer = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 0. parsing arguments passed to this route (business page)
    Map args = ModalRoute.of(context).settings.arguments as Map;
    Job job = args['job'];
    BusinessPage businessPage = args['businessPage'];

    // 1. static part : set up common part of header and footer
    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          Text(
            "${job.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ];

    // 2. dynamic part : change footer according to user's role in business page
    if (businessPage.role == VacancyRole.BUSINESS_OWNER) {
      grpcFetchJobApplications(AppUser.sessionKey, job).then((tuple) async {
        bool success = tuple.item1;
        List<JobApplication> jobApplications = tuple.item2;
        if (success)
          setState(() {
            _jobApplications = jobApplications;
          });
        else {
          await AppUser.signOut();
          await Navigator.pushReplacementNamed(context, '/');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemCount: _header.length + _jobApplications.length + _footer.length, itemBuilder: (BuildContext context, index) => getListViewItems(context, index)));
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onVacancyApplicationPressed(BuildContext context, JobApplication vacancyApplication, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(child: Text("Approve"), onPressed: () => _onApproveButtonPressed(context, index)),
                  RaisedButton(
                    child: Text("Decline"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ));
        });
  }

  void _onApproveButtonPressed(BuildContext context, int index) {
    bool succcess;
    grpcApproveJobApplication(AppUser.sessionKey, _jobApplications[index]).then((value) {
      setState(() {
        succcess = value;
      });
    });
    if (succcess) {
      toast("Job application Approved!");
    }
  }

  void _onDeclineButtonPressed() {
    //TODO create decline functionality
  }

  Widget buildVacancyApplicationItem(BuildContext context, int index) {
    Row vacancyApplicationsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onVacancyApplicationPressed(context, _jobApplications[index], index),
          child: Text(
            "${_jobApplications[index].message}",
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );

    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getTitleWidget("VacancyApplications", textColor: Colors.black), vacancyApplicationsRow],
      );
    } else
      return vacancyApplicationsRow;
  }

  Widget getListViewItems(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _jobApplications.length)
      return _footer[index - _footer.length - _jobApplications.length];
    else
      return buildVacancyApplicationItem(context, index - _header.length);
  }
}
