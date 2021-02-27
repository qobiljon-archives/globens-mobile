import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'PhotoSelectorModalView.dart';

class BusinessPageCreatorModalView extends StatefulWidget {
  @override
  _BusinessPageCreatorModalViewState createState() => _BusinessPageCreatorModalViewState();
}

class _BusinessPageCreatorModalViewState extends State<BusinessPageCreatorModalView> {
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _onBackButtonPressed,
                ),
                getTitleWidget(Locale.get("Business details"), textColor: Colors.black, margin: EdgeInsets.all(0)),
              ],
            ),
          ),
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
                    backgroundImage: _businessPageImageBytes == null ? AssetImage('assets/placeholder_image.png') : MemoryImage(_businessPageImageBytes),
                  ),
                ),
              ),
              Flexible(
                  child: TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                  labelText: Locale.get("Name of business"),
                  hintText: Locale.get("e.g., SpaceX"),
                ),
              )),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              child: RaisedButton.icon(
                onPressed: _createBusinessPagePressed,
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
        ],
      ),
    );
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _selectImagePressed(BuildContext context) async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));
    if (PhotoSelectorModalView.resultImageBytes != null)
      setState(() {
        _businessPageImageBytes = PhotoSelectorModalView.resultImageBytes;
      });
  }

  void _createBusinessPagePressed() async {
    if (_titleTextController.text.length < 2) {
      await toast(Locale.get("Title must be at least two characters"));
      return;
    }
    if (_businessPageImageBytes == null) {
      await toast(Locale.get("A business page must have an icon"));
      return;
    }

    bool success = await grpcCreateBusinessPage(AppUser.sessionKey, BusinessPage.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
