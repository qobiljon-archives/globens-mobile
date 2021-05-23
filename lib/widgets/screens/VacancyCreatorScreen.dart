import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

class VacancyCreatorScreen extends StatefulWidget {
  static const String route_name = '/create_vacancy_screen';

  @override
  State<StatefulWidget> createState() => _CreateVacancyState();
}

class _CreateVacancyState extends State<VacancyCreatorScreen> {
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
      appBar: AppBar(title: Text(Locale.get("Vacancy details"))),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  image: AssetImage('assets/placeholder_vacancy.png'),
                  width: 100,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black12,
            ),
            Container(
              padding: EdgeInsets.all(26),
              child: Flexible(
                  child: TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                  labelText: Locale.get("Vacancy name"),
                  labelStyle: TextStyle(color: Colors.blueAccent),
                  hintText: Locale.get("e.g., Assistant sales manager"),
                ),
              )),
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
              ),
            ),
          ],
        ),
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
}
