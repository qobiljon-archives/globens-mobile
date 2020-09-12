import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

import 'job application modal view.dart';

class VacantJobsListScreen extends StatefulWidget {
  @override
  _VacantJobsListScreenState createState() => _VacantJobsListScreenState();
}

class _VacantJobsListScreenState extends State<VacantJobsListScreen> {
  List<Job> _jobs = [];
  List<Widget> _header = [];

  @override
  void initState() {
    super.initState();

    _header = [getTitleWidget("Vacancies")];
    grpcFetchBusinessPageVacancies(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<Job> jobs = tuple.item2;
      if (success) {
        setState(() {
          _jobs = jobs;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _header.length + _jobs.length,
          itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget buildVacancy(BuildContext context, int index) {
    Row jobRow = Row(
      children: [
        GestureDetector(
            child: Text(
              "${_jobs[index].title}",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () => openVacancyDetails(context, index))
      ],
    );
    return jobRow;
  }

  void openVacancyDetails(BuildContext context, index) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${_jobs[index].title}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Apply"),
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) => JobApplicationEditorModalView.getModalView(_jobs[index], context));
                    },
                  ),
                  RaisedButton(
                    child: Text("Dismiss"),
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

  Widget getListViewItem(BuildContext context, int index) {
    if (index == 0)
      return _header[index];
    else {
      index -= _header.length;
      return buildVacancy(context, index);
    }
  }
}
