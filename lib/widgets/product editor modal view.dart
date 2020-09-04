import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class ProductPageEditorWidget extends StatefulWidget {
  final BusinessPage _businessPage;

  const ProductPageEditorWidget(this._businessPage);

  @override
  _ProductPageEditorWidgetState createState() => _ProductPageEditorWidgetState();
}

class _ProductPageEditorWidgetState extends State<ProductPageEditorWidget> {
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
        getTitleWidget("Create a new Product", textColor: Colors.black),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  showPhotoUploadOptions(context);
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
          onPressed: createProductPressed,
          child: Text("Create"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(),
        )
      ],
    ));
  }

  void showPhotoUploadOptions(BuildContext context) async {
    PhotoSelectorWidget.resultImageBytes = null;
    await showModalBottomSheet(context: context, builder: (context) => PhotoSelectorWidget());
    Uint8List resultImageBytes = PhotoSelectorWidget.resultImageBytes != null ? PhotoSelectorWidget.resultImageBytes : (await rootBundle.load('assets/business_page_placeholder.png')) as Uint8List;
    setState(() {
      _businessPageImageBytes = resultImageBytes;
    });
  }

  void createProductPressed() async {
    bool success = await grpcCreateProduct(AppUser.sessionKey, widget._businessPage.id, Product.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(_context).pop();
    else
      toast("Check your Internet connectivity!");
  }
}
