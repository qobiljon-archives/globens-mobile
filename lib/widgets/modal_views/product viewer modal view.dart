import 'package:globens_flutter_client/widgets/modal_views/photo%20selector%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class ProductEditorModalView extends StatefulWidget {
  final BusinessPage _businessPage;

  const ProductEditorModalView(this._businessPage);

  @override
  _ProductEditorModalViewState createState() => _ProductEditorModalViewState();
}

class _ProductEditorModalViewState extends State<ProductEditorModalView> {
  final _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget("Create a new product", textColor: Colors.black),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    _showPhotoUploadOptions(context);
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
                  labelText: "Please enter the new product's name here",
                  hintText: "e.g., British English pronunciation techniques",
                ),
              )),
            ],
          ),
          RaisedButton(
            onPressed: () => _createProductPressed(context),
            child: Text("Create"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(),
          )
        ],
      ),
    );
  }

  void _showPhotoUploadOptions(BuildContext context) async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));
    Uint8List resultImageBytes = PhotoSelectorModalView.resultImageBytes != null ? PhotoSelectorModalView.resultImageBytes : (await rootBundle.load('assets/business_page_placeholder.png')) as Uint8List;
    setState(() {
      _businessPageImageBytes = resultImageBytes;
    });
  }

  void _createProductPressed(BuildContext context) async {
    if (_titleTextController.text.length < 2) {
      await toast("Product title cannot be less than two characters");
      return;
    } else if (_businessPageImageBytes == null) {
      await toast("Product must have an icon");
      return;
    }

    bool success = await grpcCreateProduct(AppUser.sessionKey, widget._businessPage.id, Product.create(_titleTextController.text, _businessPageImageBytes));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
