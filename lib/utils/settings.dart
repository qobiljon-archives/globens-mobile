import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

final String grpc_host = '165.246.42.173';
final int grpc_port = 50053;
//region get title for businesspage
Widget getTitleWidget(String text, {Color textColor = Colors.blue}) {
  return Container(
    margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 20.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}
//endregion
//region get title for products
Widget getTitleWidgetForProducts(String page_category, String businesspage_name, Function pressButton) {
  return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: pressButton,
              ),
              Text(
                page_category,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
          Container(

            // alignment: Alignment.topLeft,
            child: Text(
              "$businesspage_name",

              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ));
}
//endregion
//region photo selector widget
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
