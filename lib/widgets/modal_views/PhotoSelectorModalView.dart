import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:typed_data';

class PhotoSelectorModalView {
  static Uint8List resultImageBytes;

  static Widget getContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30.0, right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => _onBackButtonPressed(context),
                ),
                getTitleWidget(Locale.get("Method"), textColor: Colors.black, margin: EdgeInsets.all(0)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton.icon(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: Text(
                    Locale.get("Camera"),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () => _captureCameraPressed(context)),
              RaisedButton.icon(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(
                    Icons.photo,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: Text(
                    Locale.get("Gallery"),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () => _galleryImagePressed(context)),
            ],
          ),
        ],
      ),
    );
  }

  static void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  static void _galleryImagePressed(BuildContext context) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, maxWidth: 512, maxHeight: 512);
    PhotoSelectorModalView.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  static void _captureCameraPressed(BuildContext context) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 512, maxHeight: 512);
    PhotoSelectorModalView.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
