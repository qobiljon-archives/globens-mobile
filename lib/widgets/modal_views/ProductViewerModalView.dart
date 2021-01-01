import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PhotoSelectorModalView.dart';
import 'dart:typed_data';

class ProductViewerModalView extends StatefulWidget {
  final BusinessPage _businessPage;
  final Product _product;

  ProductViewerModalView(this._businessPage, this._product);

  @override
  _ProductViewerModalViewState createState() => _ProductViewerModalViewState();
}

class _ProductViewerModalViewState extends State<ProductViewerModalView> {
  final _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;
  List<Widget> childWidgets = [];
  Widget _editingView;

  @override
  Widget build(BuildContext context) {
    _editingView = Column(
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
    );
    if (widget._product != null) {
      if (widget._businessPage.role == Job.BUSINESS_OWNER_ROLE || widget._businessPage.role == Job.INDIVIDUAL_ENTREPRENEUR_ROLE) {
        childWidgets.addAll([
          getTitleWidget("Viewing a product"),
          Text("Product name: ${widget._product.name}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("delete"),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("edit"),
                onPressed: () {},
              ),
            ],
          ),
        ]);
      } else {
        childWidgets.addAll([
          getTitleWidget("Viewing a product"),
          Text("Product name: ${widget._product.name}"),
          RaisedButton(
            child: Text("edit"),
            onPressed: () {},
          )
        ]);
      }
    } else {
      childWidgets.clear();
      childWidgets.add(_editingView);
    }
    return SingleChildScrollView(
        child: Column(
      children: childWidgets,
    ));
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

    // todo add price and category to product creation step
    bool success = true; //await grpcCreateProduct(AppUser.sessionKey, widget._businessPage, Product.create(_titleTextController.text, _businessPageImageBytes, widget._businessPage, 0.0, Currency.KRW));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _deleteProductPressed(BuildContext context) {
    //TODO Delete a product
  }

  void _editProductPressed(BuildContext context) {
    //TODO Edit a  product
  }
}
