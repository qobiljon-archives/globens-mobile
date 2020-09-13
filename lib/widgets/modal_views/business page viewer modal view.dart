import 'package:globens_flutter_client/widgets/modal_views/photo%20selector%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class BusinessPageViewerModalView extends StatefulWidget {
  @override
  _BusinessPageViewerModalViewState createState() => _BusinessPageViewerModalViewState();
}

class _BusinessPageViewerModalViewState extends State<BusinessPageViewerModalView> {
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;

  @override
  Widget build(BuildContext context) {
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
                  _selectImagePressed(context);
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
          onPressed: () => _createBusinessPagePressed(context),
          child: Text("Create"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(),
        )
      ],
    ));
  }

  void _selectImagePressed(BuildContext context) async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));
    if (PhotoSelectorModalView.resultImageBytes != null)
      setState(() {
        _businessPageImageBytes = PhotoSelectorModalView.resultImageBytes;
      });
  }

  void _createBusinessPagePressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast("Title must be at least two characters");
      return;
    }
    if (_businessPageImageBytes == null) {
      await toast("A business page must have an icon");
      return;
    }

    bool success = await grpcCreateBusinessPage(AppUser.sessionKey, BusinessPage.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(context).pop();
    else{
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
