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
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  Uint8List _productImageBytes;
  Map<int, ProductCategory> _categories = Map<int, ProductCategory>();
  int _selectedCategoryId;
  String _selectedCurrency;

  @override
  void initState() {
    super.initState();

    // dummy values for initial display
    _categories[1] = ProductCategory.create(1, "Others", null, null);
    _selectedCategoryId = 1;
    _selectedCurrency = Currency.KRW.name;

    grpcFetchProductCategories().then((tp) {
      bool success = tp.item1;
      List<ProductCategory> categories = tp.item2;
      this._categories.clear();
      for (ProductCategory category in categories)
        this._categories[category.id] = category;
      if (success)
        setState(() {
          _selectedCategoryId = 1;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(240, 242, 245, 1),
      padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 30.0 + MediaQuery
          .of(context)
          .viewInsets
          .bottom),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
              margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: _onBackButtonPressed),
                getTitleWidget("Product details", textColor: Colors.black, margin: EdgeInsets.zero),
              ])),
          Row(children: [
            Flexible(
                child: Card(
                    margin: EdgeInsets.zero,
                    child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0), child: TextField(controller: _titleTextController, decoration: InputDecoration(labelText: "Product name", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., Yoga training 24/7", border: InputBorder.none))))),
            Container(margin: EdgeInsets.all(10.0), child: GestureDetector(onTap: _showPhotoUploadOptions, child: CircleAvatar(radius: 30.0, backgroundImage: _productImageBytes == null ? AssetImage('assets/image_placeholder.png') : MemoryImage(_productImageBytes)))),
          ]),
          Card(
            margin: EdgeInsets.only(top: 10.0),
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: DropdownButton<int>(
                  isExpanded: true,
                  value: _selectedCategoryId,
                  icon: _categories[_selectedCategoryId].pictureBlob == null ? Icon(Icons.arrow_downward) : Image.memory(_categories[_selectedCategoryId].pictureBlob, width: 20),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(),
                  onChanged: (int newId) {
                    setState(() {
                      _selectedCategoryId = newId;
                    });
                  },
                  items: _categories.values
                      .map<DropdownMenuItem<int>>((ProductCategory category) =>
                      DropdownMenuItem<int>(
                          value: category.id,
                          child: Text(
                            'Category : ${category.name}',
                          )))
                      .toList()),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Flexible(
                    child: Card(
                        margin: EdgeInsets.only(right: 20.0),
                        child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextField(
                                controller: _priceTextController,
                                keyboardType: TextInputType.numberWithOptions(signed: false),
                                decoration: InputDecoration(labelText: "Price", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., 1000", border: InputBorder.none))))),
                DropdownButton<String>(
                    value: _selectedCurrency,
                    icon: Icon(Icons.expand_more),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(),
                    onChanged: (String newCurrencyName) {
                      setState(() {
                        _selectedCurrency = newCurrencyName;
                      });
                    },
                    items: Currency.values.map<DropdownMenuItem<String>>((Currency currency) => DropdownMenuItem<String>(value: currency.name, child: Text(currency.name))).toList())
              ],
            ),
          ),
          Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextField(
                      controller: _descriptionTextController,
                      minLines: 10,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(labelText: "Product description", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., the best product.", border: InputBorder.none)))),
          Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: RaisedButton.icon(
                  onPressed: _createProductPressed,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(Icons.upload_file, color: Colors.white),
                  label: Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
        ],
      ),
    );
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _showPhotoUploadOptions() async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));
    Uint8List resultImageBytes = PhotoSelectorModalView.resultImageBytes != null ? PhotoSelectorModalView.resultImageBytes : (await rootBundle.load('assets/image_placeholder.png')) as Uint8List;
    setState(() {
      _productImageBytes = resultImageBytes;
    });
  }

  void _createProductPressed() async {
    double price = double.tryParse(_priceTextController.text) ?? double.nan;
    Currency currency = Currency.KRW;
    if (_selectedCurrency == Currency.KRW.name)
      currency = Currency.KRW;
    else if (_selectedCurrency == Currency.USD.name)
      currency = Currency.USD;
    else if (_selectedCurrency == Currency.RUB.name)
      currency = Currency.RUB;
    else if (_selectedCurrency == Currency.UZS.name)
      currency = Currency.UZS;

    if (_titleTextController.text.length < 2) {
      await toast("Product title cannot be less than two characters!");
      return;
    } else if (price == double.nan) {
      await toast("Please fix the price value!");
      return;
    } else if (_descriptionTextController.text.length == 0) {
      await toast("Product description is missing!");
      return;
    } else if (_productImageBytes == null) {
      await toast("Product image is missing!");
      return;
    }

    bool success = await grpcCreateProduct(AppUser.sessionKey, widget._businessPage, Product.create(_titleTextController.text, _categories[_selectedCategoryId], _productImageBytes, widget._businessPage, price, currency, _descriptionTextController.text));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
