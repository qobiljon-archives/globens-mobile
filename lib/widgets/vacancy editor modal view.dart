import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/Vacancy.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';

//region productpageeditor widget
class VacancyPageEditorWidget extends StatefulWidget {
  final BusinessPage _businessPage;

  const VacancyPageEditorWidget(this._businessPage);

  @override
  _VacancyPageEditorWidgetState createState() => _VacancyPageEditorWidgetState();
}

class _VacancyPageEditorWidgetState extends State<VacancyPageEditorWidget> {
  //region vars
  TextEditingController _titleTextController = TextEditingController();


  //endregion
  //region overrides
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

  //endregion



  //region onPressed method(s)
  void createVacancyPressed(BuildContext context) async {
    bool success = await grpcCreateVacancy(AppUser.sessionKey, widget._businessPage.id, Vacancy.create(_titleTextController.text));

    if (success)
      Navigator.of(context).pop();
    else
      Fluttertoast.showToast(msg: "Check your Internet connectivity!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }

//endregion
}
//endregion
