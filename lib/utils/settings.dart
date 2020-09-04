import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

final String grpc_host = '165.246.42.173';
final int grpc_port = 50053;

Widget getTitleWidget(String text, {Color textColor = Colors.blue}) {
  return Container(
    margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 20.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}

class PhotoSelectorWidget extends StatefulWidget {
  static Uint8List resultImageBytes;

  @override
  _PhotoSelectorWidgetState createState() => _PhotoSelectorWidgetState();
}

class _PhotoSelectorWidgetState extends State<PhotoSelectorWidget> {
  BuildContext _context;

  //region select_photo functions
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

  //endregion
  //regionoverrides
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
//endregion
}
//endregion
