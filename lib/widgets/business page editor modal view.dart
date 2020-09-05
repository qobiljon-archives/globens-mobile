import 'package:globens_flutter_client/widgets/photo%20selector%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class BusinessPageEditorModalView extends StatefulWidget {
  @override
  _BusinessPageEditorModalViewState createState() => _BusinessPageEditorModalViewState();
}

class _BusinessPageEditorModalViewState extends State<BusinessPageEditorModalView> {
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = this.context;
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        getTitleWidget("New business page", textColor: Colors.black),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  selectImagePressed(context);
                },
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: _businessPageImageBytes == null ? AssetImage('assets/business_page_placeholder.png') : MemoryImage(_businessPageImageBytes),
                ),
              ),
            ),
            Flexible(
                child: TextField(
              controller: _titleTextController,
              decoration: InputDecoration(
                labelText: "Title",
                hintText: "Enter your title",
              ),
            )),
          ],
        ),
        RaisedButton(
          onPressed: createBusinessPagePressed,
          child: Text("Create"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(),
        )
      ],
    ));
  }

  void selectImagePressed(BuildContext context) async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(context: context, builder: (context) => PhotoSelectorModalView());
    if (PhotoSelectorModalView.resultImageBytes != null)
      setState(() {
        _businessPageImageBytes = PhotoSelectorModalView.resultImageBytes;
      });
  }

  void createBusinessPagePressed() async {
    if (_titleTextController.text.length < 2) {
      toast("Title must be at least two characters");
      return;
    }
    if (_businessPageImageBytes == null) {
      toast("A business page must have an icon");
      return;
    }

    bool success = await grpcCreateBusinessPage(AppUser.sessionKey, BusinessPage.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(_context).pop();
    else
      toast("Check your Internet connectivity!");
  }
}
