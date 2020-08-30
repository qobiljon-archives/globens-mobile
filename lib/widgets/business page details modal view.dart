import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class PhotoSelectorWidget extends StatefulWidget {
  static Uint8List resultImageBytes;

  @override
  _PhotoSelectorWidgetState createState() => _PhotoSelectorWidgetState();
}

class _PhotoSelectorWidgetState extends State<PhotoSelectorWidget> {
  BuildContext _context;

  void getImage() async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, maxWidth: 96, maxHeight: 96);
    PhotoSelectorWidget.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(_context)) Navigator.pop(_context);
  }

  void openCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 96, maxHeight: 96);
    PhotoSelectorWidget.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(_context)) Navigator.pop(_context);
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: IconButton(
                icon: Icon(
                  Icons.photo_camera,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: openCamera),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: getImage),
          ),
        ],
      ),
    );
  }
}

class BusinessPageEditorWidget extends StatefulWidget {
  @override
  _BusinessPageEditorWidgetState createState() => _BusinessPageEditorWidgetState();
}

class _BusinessPageEditorWidgetState extends State<BusinessPageEditorWidget> {
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Spacer(),
        )
      ],
    );
  }

  void selectImagePressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (context) => PhotoSelectorWidget());
    Uint8List resultImageBytes = PhotoSelectorWidget.resultImageBytes != null ? PhotoSelectorWidget.resultImageBytes : (await rootBundle.load('assets/business_page_placeholder.png')) as Uint8List;
    setState(() {
      _businessPageImageBytes = resultImageBytes;
    });
  }

  void createBusinessPagePressed() async {
    bool success = await grpcCreateBusinessPage(AppUser.sessionKey, BusinessPage.create(_titleTextController.text, _businessPageImageBytes));
    if (success)
      Navigator.of(context).pop();
    else
      Fluttertoast.showToast(msg: "Check your Internet connectivity!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
  }
}
