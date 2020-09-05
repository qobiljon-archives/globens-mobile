import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/Vacancy.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

class VacancyPageEditorModalView extends StatefulWidget {
  final BusinessPage _businessPage;

  const VacancyPageEditorModalView(this._businessPage);

  @override
  _VacancyPageEditorModalViewState createState() => _VacancyPageEditorModalViewState();
}

class _VacancyPageEditorModalViewState extends State<VacancyPageEditorModalView> {
  TextEditingController _titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getTitleWidget("Create a new Vacancy", textColor: Colors.black),
        Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: TextField(
            controller: _titleTextController,
            decoration: InputDecoration(
              labelText: "Title",
              hintText: "Enter title",
            ),
          ),
        ),
        RaisedButton(
          onPressed: () => createVacancyPressed(context),
          child: Text("Create"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(),
        )
      ],
    ));
  }

  void createVacancyPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      toast("Vacancy title cannot be less than two characters");
      return;
    }

    bool success = await grpcCreateVacancy(AppUser.sessionKey, widget._businessPage.id, Vacancy.create(_titleTextController.text));

    if (success)
      Navigator.of(context).pop();
    else
      Fluttertoast.showToast(msg: "Check your Internet connectivity!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }
}
