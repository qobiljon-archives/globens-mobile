import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/VacancyApplication.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobApplicationScreen extends StatefulWidget {
  final Job job;
  final BusinessPage businessPage;

  const JobApplicationScreen(this.job, this.businessPage);

  @override
  _JobApplicationScreenState createState() => _JobApplicationScreenState();
}

class _JobApplicationScreenState extends State<JobApplicationScreen> {
  List<Widget> _header = [];
  List<JobApplication> _jobApplications = [];
  List<Widget> _footer = [];
  String status;

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
          Text(
            "${widget.job.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ];

    if (widget.businessPage.role == VacancyRole.BUSINESS_OWNER) {
      grpcFetchJobApplications(AppUser.sessionKey, widget.job).then((tuple) {
        bool success = tuple.item1;
        List<JobApplication> jobApplications = tuple.item2;
        if (success)
          setState(() {
            _jobApplications = jobApplications;
          });
        else {
          AppUser.signOut();
          Navigator.pushReplacementNamed(context, 'root');
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
