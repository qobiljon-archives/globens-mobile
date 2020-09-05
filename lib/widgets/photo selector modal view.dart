import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PhotoSelectorWidget extends StatefulWidget {
  static Uint8List resultImageBytes;

  @override
  _PhotoSelectorWidgetState createState() => _PhotoSelectorWidgetState();
}

class _PhotoSelectorWidgetState extends State<PhotoSelectorWidget> {
  BuildContext _context;

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
                onPressed: captureCameraPressed),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: galleryImagePressed),
          ),
        ],
      ),
    );
  }

  void galleryImagePressed() async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, maxWidth: 96, maxHeight: 96);
    PhotoSelectorWidget.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(_context)) Navigator.pop(_context);
  }

  void captureCameraPressed() async {
    PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera, maxWidth: 96, maxHeight: 96);
    PhotoSelectorWidget.resultImageBytes = await pickedFile.readAsBytes();
    if (Navigator.canPop(_context)) Navigator.pop(_context);
  }
}
