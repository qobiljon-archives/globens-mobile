import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/VacancyApplication.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class JobApplicationScreen extends StatefulWidget {
  final Job vacancy;
  final BusinessPage businessPage;

  const JobApplicationScreen(this.vacancy, this.businessPage);

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
            "${widget.vacancy.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ];

    if (widget.businessPage.role == VacancyRole.BUSINESS_OWNER) {
      grpcFetchJobApplications(AppUser.sessionKey, widget.businessPage.id).then((tuple) {
        bool success = tuple.item1;
        List<JobApplication> products = tuple.item2;
        if (success)
          setState(() {
            _jobApplications = products;
          });
        else {
          AppUser.signOut();
          Navigator.pushReplacementNamed(context, 'root');
        }
      });

      _footer = [
        Container(
          child: RaisedButton(
            onPressed: () {},
            child: Text("Approve"),
          ),
        )
      ];
    } else {
      _footer = [
        Container(
          child: RaisedButton(
            onPressed: _onApplyNowButtonPressed,
            child: Text("Apply Now"),
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemCount: _header.length + _jobApplications.length + _footer.length, itemBuilder: (BuildContext context, index) => getListViewItems(context, index)));
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onVacancyApplicationPressed(BuildContext context, JobApplication vacancyApplication) {}

  void _onApplyNowButtonPressed() {
    //TODO open apply job screen
  }

  Widget buildVacancyApplicationItem(BuildContext context, int index) {
    Row vacancyApplicationsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onVacancyApplicationPressed(context, _jobApplications[index]),
          child: Text(
            "${_jobApplications[index].title}",
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
