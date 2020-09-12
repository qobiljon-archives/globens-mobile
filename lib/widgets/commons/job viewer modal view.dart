import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';

class JobPageEditorModalView {
  static final _titleTextController = TextEditingController();

  static Widget getModalView(BuildContext context, BusinessPage businessPage) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getTitleWidget("Create a new vacancy", textColor: Colors.black),
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
          onPressed: () => createVacancyPressed(context, businessPage),
          child: Text("Create"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(),
        )
      ],
    ));
  }

  static void createVacancyPressed(BuildContext context, BusinessPage businessPage) async {
    if (_titleTextController.text.length < 2) {
      toast("Vacancy title cannot be less than two characters");
      return;
    }

    bool success = await grpcCreateVacantJob(AppUser.sessionKey, businessPage.id, Job.create(_titleTextController.text));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.pushReplacementNamed(context, '/');
    }
  }
}
