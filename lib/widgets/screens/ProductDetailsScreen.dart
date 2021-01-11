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
  static const String route_name = '/business_page_details/job_applications_list';

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
    Tuple2('Downloadable file', 'assets/downloadable.png'),
    Tuple2('Streamed file', 'assets/streamed.png'),
    Tuple2('Scheduled meetup', 'assets/meetup.png'),
    Tuple2('Scheduled call', 'assets/(online)call.png'),
  ];

  int _selectedCategoryId;
  int _selectedProductTypeIndex;
  String _selectedCurrency;
  List<File> _productContentFiles = <File>[];

  @override
  void initState() {
    super.initState();

    // dummy values for initial display
    _categories[1] = ProductCategory.create(1, "Others", null, null);
    _selectedCategoryId = 1;
    _selectedProductTypeIndex = 0;
    _selectedCurrency = Currency.KRW.name;

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
              getSectionSplitter("Basic info"),
              Row(children: [
                Flexible(child: Card(margin: EdgeInsets.zero, child: Container(padding: EdgeInsets.only(left: 10.0, right: 10.0), child: TextField(controller: _titleTextController, decoration: InputDecoration(labelText: "Product name", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., Yoga training 24/7", border: InputBorder.none))))),
                Container(margin: EdgeInsets.all(10.0), child: GestureDetector(onTap: _showPhotoUploadOptions, child: CircleAvatar(radius: 30.0, backgroundImage: _productImageBytes == null ? AssetImage('assets/image_placeholder.png') : MemoryImage(_productImageBytes)))),
              ]),
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
                      items: _categories.values.map<DropdownMenuItem<int>>((ProductCategory category) => DropdownMenuItem<int>(value: category.id, child: Text('Category : ${category.name}'))).toList()),
                ),
              ),
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
                    onChanged: (int newId) {
                      setState(() {
                        _selectedProductTypeIndex = newId;
                      });
                    },
                    items: _productTypes.map<DropdownMenuItem<int>>((Tuple2<String, String> selectedProductType) => DropdownMenuItem<int>(value: _productTypes.indexOf(selectedProductType), child: Text("Content: ${selectedProductType.item1}"))).toList(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Flexible(child: Card(margin: EdgeInsets.only(right: 20.0), child: Container(padding: EdgeInsets.only(left: 10.0, right: 10.0), child: TextField(controller: _priceTextController, keyboardType: TextInputType.numberWithOptions(signed: false), decoration: InputDecoration(labelText: "Price", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., 1000", border: InputBorder.none))))),
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
              Card(margin: EdgeInsets.only(top: 10.0), child: Container(padding: EdgeInsets.only(left: 10.0, right: 10.0), child: TextField(controller: _descriptionTextController, minLines: 10, maxLines: 10, keyboardType: TextInputType.multiline, decoration: InputDecoration(labelText: "Product description", labelStyle: TextStyle(color: Colors.blueAccent), hintText: "e.g., the best product.", border: InputBorder.none)))),
              getSectionSplitter("Product content"),
              if (_productContentFiles.length > 0)
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
              RaisedButton.icon(onPressed: _uploadFilePressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.attachment_outlined, color: Colors.white), label: Text(_productContentFiles.length == 0 ? "SELECT CONTENT" : "RESELECT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              Divider(height: 10.0),
              Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _createProductPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.upload_file, color: Colors.white), label: Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
            ],
          ),
        ));
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
