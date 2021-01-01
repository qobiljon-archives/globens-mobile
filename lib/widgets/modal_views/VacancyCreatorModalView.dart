import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class VacancyCreatorModalView extends StatefulWidget {
  final BusinessPage businessPage;

  VacancyCreatorModalView({this.businessPage});

  @override
  _VacancyCreatorModalViewState createState() => _VacancyCreatorModalViewState();
}

class _VacancyCreatorModalViewState extends State<VacancyCreatorModalView> {
  final TextEditingController _titleTextController = TextEditingController();

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
                onPressed: _onBackButtonPressed,
              ),
              getTitleWidget("Vacancy details", textColor: Colors.black, margin: EdgeInsets.zero),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/vacancy.png'),
              ),
            ),
            Flexible(
                child: TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                labelText: "Vacancy name",
                hintText: "e.g., Assistant sales manager",
              ),
            )),
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: 20.0),
            child: RaisedButton.icon(
              onPressed: _createVacancyPressed,
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              icon: Icon(
                Icons.upload_file,
                color: Colors.white,
              ),
              label: Text(
                "CREATE",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ]),
    );
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _createVacancyPressed() async {
    if (_titleTextController.text.length < 2) {
      await toast("Vacancy title cannot be less than two characters");
      return;
    }

    bool success = await grpcCreateVacantJob(
      AppUser.sessionKey,
      widget.businessPage,
      Job.create(_titleTextController.text),
    );

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _applyForVacancyPressed() async {
    // todo applying to vacancy part
    // await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => JobApplicationViewerModalView(job: widget.job));
    // Navigator.of(context).pop();
  }

  void _viewJobApplicationsPressed() async {
    // todo show applications part - only business owner must be able to see the following screen
    // await Navigator.of(context).pushNamed('/business_page_details/job_applications_list', arguments: {'job': widget.job, 'businessPage': widget.businessPage});
    // Navigator.of(context).pop();
  }
}
