import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PhotoSelectorModalView.dart';
import 'dart:typed_data';

class ProductCreatorModalView extends StatefulWidget {
  final BusinessPage _businessPage;

  ProductCreatorModalView(this._businessPage);

  @override
  _ProductCreatorModalViewState createState() => _ProductCreatorModalViewState();
}

class _ProductCreatorModalViewState extends State<ProductCreatorModalView> {
  final _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;
  Map<int, ProductCategory> _categories = Map<int, ProductCategory>();
  int _selectedCategoryId;

  @override
  void initState() {
    super.initState();

    // dummy values for initial display
    _categories[1] = ProductCategory.create(1, "Others", null, null);
    _selectedCategoryId = 1;

    grpcFetchProductCategories().then((tp) {
      bool success = tp.item1;
      List<ProductCategory> categories = tp.item2;
      this._categories.clear();
      for (ProductCategory category in categories) this._categories[category.id] = category;
      if (success)
        setState(() {
          _selectedCategoryId = 1;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget("Product details", textColor: Colors.black),
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
          DropdownButton<int>(
            value: _selectedCategoryId,
            icon: _categories[_selectedCategoryId].pictureBlob == null
                ? Icon(Icons.arrow_downward)
                : Image.memory(
                    _categories[_selectedCategoryId].pictureBlob,
                    width: 20,
                  ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (int newId) {
              setState(() {
                _selectedCategoryId = newId;
              });
            },
            items: _categories.values.map<DropdownMenuItem<int>>((ProductCategory category) {
              return DropdownMenuItem<int>(
                value: category.id,
                child: Text(category.name),
              );
            }).toList(),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.0),
              child: RaisedButton.icon(
                onPressed: _createProductPressed,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                icon: Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: Text(
                  "CREATE",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
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

  void _createProductPressed() async {
    if (_titleTextController.text.length < 2) {
      await toast("Product title cannot be less than two characters");
      return;
    } else if (_businessPageImageBytes == null) {
      await toast("Product must have an icon");
      return;
    }

    // todo add price to product creation step
    bool success = await grpcCreateProduct(AppUser.sessionKey, widget._businessPage, Product.create(_titleTextController.text, _categories[_selectedCategoryId], _businessPageImageBytes, widget._businessPage, 0.0, Currency.KRW));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
