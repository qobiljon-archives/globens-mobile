import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class VacancyCreatorModalView extends StatelessWidget {
  final BusinessPage businessPage;
  final TextEditingController _titleTextController = TextEditingController();

  VacancyCreatorModalView({this.businessPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          margin: EdgeInsets.only(right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => _onBackButtonPressed(context),
              ),
              getTitleWidget(Locale.get("Vacancy details"), textColor: Colors.black, margin: EdgeInsets.zero),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/placeholder_vacancy.png'),
              ),
            ),
            Flexible(
                child: TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                labelText: Locale.get("Vacancy name"),
                hintText: Locale.get("e.g., Assistant sales manager"),
              ),
            )),
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 20.0),
            child: RaisedButton.icon(
              onPressed: () => _createVacancyPressed(context),
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              icon: Icon(
                Icons.upload_file,
                color: Colors.white,
              ),
              label: Text(
                Locale.get("Create"),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ]),
    );
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _createVacancyPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast(Locale.get("Vacancy title cannot be less than two characters"));
      return;
    }

    bool success = await grpcCreateVacantJob(
      AppUser.sessionKey,
      businessPage,
      Job.create(_titleTextController.text),
    );

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _applyForVacancyPressed(BuildContext context) async {
    // todo applying to vacancy part
    // await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => JobApplicationViewerModalView(job: widget.job));
    // Navigator.of(context).pop();
  }

  void _viewJobApplicationsPressed(BuildContext context) async {
    // todo show applications part - only business owner must be able to see the following screen
    // await Navigator.of(context).pushNamed('/business_page_details/job_applications_list', arguments: {'job': widget.job, 'businessPage': widget.businessPage});
    // Navigator.of(context).pop();
  }
}
