import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';
import '../modal_views/PhotoSelectorModalView.dart';
import 'dart:typed_data';

class ProductDetailsScreen extends StatefulWidget {
  static const String route_name = '/product_details_screen';

  ProductDetailsScreen();

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _titleTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();

  BusinessPage _businessPage;
  Uint8List _productImageBytes;

  Map<int, ProductCategory> _categories = Map<int, ProductCategory>();

  List<Tuple2<String, String>> _productTypes = <Tuple2<String, String>>[
    Tuple2('Downloadable files', 'assets/product_type_downloadable.png'),
    Tuple2('Streamed files', 'assets/product_type_streamed.png'),
    Tuple2('Scheduled face-to-face meeting', 'assets/product_type_scheduled.png'),
    Tuple2('Scheduled online call', 'assets/product_type_scheduled.png'),
  ];

  int _selectedCategoryId;
  int _selectedProductTypeIndex;
  Currency _selectedCurrency;
  List<File> _productContentFiles = <File>[];

  @override
  void initState() {
    super.initState();

    // dummy values for initial display
    _categories[1] = ProductCategory.create(1, "Others", null, null);
    _selectedCategoryId = 1;
    _selectedProductTypeIndex = 0;
    _selectedCurrency = Currency.KRW;

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
  void didChangeDependencies() {
    super.didChangeDependencies();

    _businessPage = ModalRoute.of(context).settings.arguments as BusinessPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 242, 245, 1),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: _onBackButtonPressed,
                  ),
                  getTitleWidget('Product details', textColor: Colors.black, margin: EdgeInsets.all(0))
                ],
              ),
              getSectionSplitter("Basic information"),
              Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 1.0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: _showPhotoUploadOptions,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                                child: _productImageBytes == null ? Image.asset('assets/placeholder_background_image.png', fit: BoxFit.cover) : Image.memory(_productImageBytes, fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                "${Product.price2string(double.tryParse(_priceTextController.text) ?? 0.0, _selectedCurrency)}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepOrange),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 20.0,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: TextField(
                                    controller: _titleTextController,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                                    decoration: InputDecoration(labelText: "Product name", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., Yoga training 24/7", border: InputBorder.none)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
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
                                    keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                                    decoration: InputDecoration(labelText: "Price", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., 1000", border: InputBorder.none))))),
                    DropdownButton<String>(
                        value: _selectedCurrency.name,
                        icon: Icon(Icons.expand_more),
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(),
                        onChanged: (String newCurrencyName) {
                          setState(() {
                            if (newCurrencyName == Currency.KRW.name)
                              _selectedCurrency = Currency.KRW;
                            else if (newCurrencyName == Currency.RUB.name)
                              _selectedCurrency = Currency.RUB;
                            else if (newCurrencyName == Currency.USD.name)
                              _selectedCurrency = Currency.USD;
                            else if (newCurrencyName == Currency.UZS.name) _selectedCurrency = Currency.UZS;
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
                  child: DropdownButton<int>(
                      isExpanded: true,
                      value: _selectedCategoryId,
                      icon: _categories[_selectedCategoryId].pictureBlob == null ? Icon(Icons.arrow_drop_down) : Image.memory(_categories[_selectedCategoryId].pictureBlob, width: 20),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(),
                      onChanged: (int newId) {
                        setState(() {
                          _selectedCategoryId = newId;
                        });
                      },
                      items: _categories.values
                          .map<DropdownMenuItem<int>>((ProductCategory category) => DropdownMenuItem<int>(
                              value: category.id,
                              child: Text(
                                'Product category : ${category.name}',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                              )))
                          .toList()),
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                          decoration: InputDecoration(labelText: "Product description", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., the best product.", border: InputBorder.none)))),
              getSectionSplitter("Product content"),
              Card(
                margin: EdgeInsets.only(top: 10.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButton<int>(
                    isExpanded: true,
                    value: _selectedProductTypeIndex,
                    icon: Image.asset(_productTypes[_selectedProductTypeIndex].item2, width: 20),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(),
                    onChanged: _onProductTypeChanged,
                    items: _productTypes.map<DropdownMenuItem<int>>((Tuple2<String, String> selectedProductType) => DropdownMenuItem<int>(value: _productTypes.indexOf(selectedProductType), child: Text("Content type : ${selectedProductType.item1}"))).toList(),
                  ),
                ),
              ),
              if ([0, 1].contains(_selectedProductTypeIndex) && _productContentFiles.length > 0)
                Column(
                    children: _productContentFiles
                        .map((file) => Card(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Container(
                                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.5, bottom: 2.5),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  Image.file(
                                    file,
                                    width: 30.0,
                                  ),
                                  Text(RegExp(r'^(.+/)(.+)$').firstMatch(file.path).group(2)),
                                  IconButton(onPressed: () => _removeFileContent(file), icon: Icon(Icons.highlight_remove_outlined, color: Colors.redAccent))
                                ]))))
                        .toList()),
              if ([0, 1].contains(_selectedProductTypeIndex))
                RaisedButton.icon(
                    onPressed: _uploadFilePressed,
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    icon: Icon(Icons.attachment_outlined, color: Colors.white),
                    label: Text(_productContentFiles.length == 0 ? "SELECT CONTENT" : "RESELECT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              if ([2, 3].contains(_selectedProductTypeIndex)) Column(),
              getSectionSplitter("Proceed with this product"),
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
        ));
  }

  void _onProductTypeChanged(int newIndex) {
    setState(() {
      _selectedProductTypeIndex = newIndex;
    });
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _showPhotoUploadOptions() async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));
    Uint8List resultImageBytes = PhotoSelectorModalView.resultImageBytes != null ? PhotoSelectorModalView.resultImageBytes : (await rootBundle.load('assets/placeholder_image.png')) as Uint8List;
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
    else if (_selectedCurrency == Currency.UZS.name) currency = Currency.UZS;

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

    bool success = await grpcCreateProduct(AppUser.sessionKey, _businessPage, Product.create(_titleTextController.text, _categories[_selectedCategoryId], _productImageBytes, _businessPage, price, currency, _descriptionTextController.text));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _uploadFilePressed() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _productContentFiles = result.paths.map((path) => File(path)).toList();
      });
    } else {
      toast("Selection cancelled!");
    }
  }

  void _removeFileContent(File file) {
    setState(() {
      _productContentFiles.remove(file);
    });
  }
}
