import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:typed_data';

class PhotoSelectorModalView {
  static Uint8List resultImageBytes;

  static Widget getContainer(BuildContext context) {
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
                onPressed: () => _captureCameraPressed(context)),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: () => _galleryImagePressed(context)),
          ),
        ],
      ),
    );
  }

  static void _galleryImagePressed(BuildContext context) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, maxWidth: 96, maxHeight: 96);
    PhotoSelectorModalView.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  static void _captureCameraPressed(BuildContext context) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 96, maxHeight: 96);
    PhotoSelectorModalView.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
