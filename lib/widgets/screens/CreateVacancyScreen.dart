import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class CreateVacancyScreen extends StatefulWidget{
  static const String route_name = '/create_vacancy_screen';

  @override
  State<StatefulWidget> createState() => _CreateVacancyState();
}

class _CreateVacancyState extends State<CreateVacancyScreen>{

  final TextEditingController _titleTextController = TextEditingController();
  BusinessPage _businessPage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var argument = ModalRoute.of(context).settings.arguments;
    if (argument is BusinessPage) {
      _businessPage = argument;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locale.get("Create new vacancy")),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
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
      ),
    );
  }

  void _createVacancyPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast(Locale.get("Vacancy title cannot be less than two characters"));
      return;
    }

    bool success = await grpcCreateVacantJob(
      AppUser.sessionKey,
      _businessPage,
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