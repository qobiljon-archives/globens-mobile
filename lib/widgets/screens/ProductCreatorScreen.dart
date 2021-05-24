import 'package:globens_flutter_client/widgets/modal_views/AvailableTimePickerModalView.dart';
import 'package:globens_flutter_client/widgets/modal_views/PhotoSelectorModalView.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/utils/DriveHelper.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';
import 'dart:typed_data';
import 'dart:io';

class ProductCreatorScreen extends StatefulWidget {
  static const String route_name = '/product_creator_screen';

  ProductCreatorScreen();

  @override
  _ProductCreatorScreenState createState() => _ProductCreatorScreenState();
}

class _ProductCreatorScreenState extends State<ProductCreatorScreen> {
  final _titleTextController = TextEditingController();
  final _priceTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  Map<ProductDeliveryType, Tuple2<String, String>> _productTypes;

  Product _product;
  BusinessPage _businessPage;
  Uint8List _productImageBytes;

  Map<int, ProductCategory> _categories = Map<int, ProductCategory>();

  int _selectedCategoryId;
  ProductDeliveryType _selectedProductDeliveryType;
  Currency _selectedCurrency;
  List<File> _productContentFiles = <File>[];
  Set<String> _uploadingFiles = Set();
  Map<String, int> _fromUntilDateTime = <String, int>{"from": -1, "until": -1};
  Map<String, Set<int>> _productAvailableTimeSlots = Map<String, Set<int>>();

  @override
  void initState() {
    super.initState();

    // dummy values for initial display
    _selectedCategoryId = 1;
    _selectedProductDeliveryType = ProductDeliveryType.FILE_DOWNLOADABLE;
    _selectedCurrency = Currency.KRW;

    _productTypes = <ProductDeliveryType, Tuple2<String, String>>{
      ProductDeliveryType.FILE_DOWNLOADABLE: Tuple2(Locale.get('Downloadable files'), 'assets/product_type_downloadable.png'),
      ProductDeliveryType.FILE_STREAMED: Tuple2(Locale.get('Streamed files'), 'assets/product_type_streamed.png'),
      ProductDeliveryType.SCHEDULED_FACE_TO_FACE: Tuple2(Locale.get('Scheduled face-to-face meeting'), 'assets/product_type_scheduled.png'),
      ProductDeliveryType.SCHEDULED_ONLINE_CALL: Tuple2(Locale.get('Scheduled online call'), 'assets/product_type_scheduled.png'),
    };

    grpcFetchProductCategories().then((tp) {
      bool success = tp.item1;
      List<ProductCategory> categories = tp.item2;
      this._categories.clear();
      for (ProductCategory category in categories) this._categories[category.id] = category;
      if (success)
        setState(() {
          _selectedCategoryId = _selectedCategoryId;
        });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    var argument = ModalRoute.of(context).settings.arguments;
    if (argument is Product) {
      _product = argument;
      _businessPage = _product.businessPage;

      _productImageBytes = _product.pictureBlob;
      _selectedCategoryId = _product.category.id;
      _selectedProductDeliveryType = _product.productType;
      _selectedCurrency = _product.currency;
      _titleTextController.text = _product.name;
      _priceTextController.text = _product.price.toString();
      _descriptionTextController.text = _product.description;
      if (_selectedProductDeliveryType == ProductDeliveryType.FILE_DOWNLOADABLE || _selectedProductDeliveryType == ProductDeliveryType.FILE_STREAMED) {
        // todo view/edit files
      } else if (_selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_FACE_TO_FACE || _selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_ONLINE_CALL) {
        // todo view/edit schedule
        _fromUntilDateTime['from'] = _product.contents['from'];
        _fromUntilDateTime['until'] = _product.contents['until'];

        _productAvailableTimeSlots.clear();
        for (var weekday in _product.contents['slots'].keys) {
          _productAvailableTimeSlots.putIfAbsent(weekday, () => _product.contents['slots'][weekday].cast<int>().toSet());
        }
      }
    } else
      _businessPage = argument as BusinessPage;
  }

  @override
  Widget build(BuildContext context) {
    bool uploadFile = _selectedProductDeliveryType == ProductDeliveryType.FILE_DOWNLOADABLE || _selectedProductDeliveryType == ProductDeliveryType.FILE_STREAMED;
    bool calendarSchedule = _selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_FACE_TO_FACE || _selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_ONLINE_CALL;

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get("Product details"), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),)),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
          shrinkWrap: true,
          children: [
            getSectionSplitter(Locale.get("Basic information")),
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
                              child: AspectRatio(aspectRatio: 1, child: _productImageBytes == null ? Image.asset('assets/placeholder_background_image.png', fit: BoxFit.cover) : Image.memory(_productImageBytes, fit: BoxFit.fitWidth)),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              Product.price2string(double.tryParse(_priceTextController.text) ?? 0.0, _selectedCurrency),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          height: 20.0,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(controller: _titleTextController, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), decoration: InputDecoration(labelText: Locale.get("Product name"), labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: Locale.get("e.g., Yoga training 24/7"), border: InputBorder.none)),
                        ),
                      )
                    ],
                  ),
                )),
            Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child:
                    DropdownButton<int>(isExpanded: true, value: _selectedCategoryId, icon: _getProductImage(), iconSize: 24, elevation: 16, underline: Container(), onChanged: _categorySelected, items: _categories.values.map<DropdownMenuItem<int>>((ProductCategory category) => DropdownMenuItem<int>(value: category.id, child: Text(Locale.get("Product category: ${Locale.REPLACE}", category.name), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)))).toList()),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: DropdownButton<ProductDeliveryType>(
                  isExpanded: true,
                  value: _selectedProductDeliveryType,
                  icon: Image.asset(_productTypes[_selectedProductDeliveryType].item2, width: 20),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(),
                  onChanged: _onProductTypeChanged,
                  items: _productTypes.keys.map<DropdownMenuItem<ProductDeliveryType>>((ProductDeliveryType selectedProductType) => DropdownMenuItem<ProductDeliveryType>(value: selectedProductType, child: Text(Locale.get("Content type: ${Locale.REPLACE}", _productTypes[selectedProductType].item1), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)))).toList(),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Flexible(
                        child: TextField(
                            controller: _priceTextController,
                            keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                            decoration: InputDecoration(labelText: calendarSchedule ? Locale.get("Price per time slot") : Locale.get("Price"), labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: Locale.get("e.g., 1000"), border: InputBorder.none))),
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
                        items: Currency.values.map<DropdownMenuItem<String>>((Currency currency) => DropdownMenuItem<String>(value: currency.name, child: Text(currency.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)))).toList())
                  ],
                ),
              ),
            ),
            Card(
                margin: EdgeInsets.only(top: 10.0),
                child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: TextField(controller: _descriptionTextController, minLines: 10, maxLines: 10, keyboardType: TextInputType.multiline, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), decoration: InputDecoration(labelText: Locale.get("Product description"), labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: Locale.get("e.g., the best product."), border: InputBorder.none)))),
            getSectionSplitter(Locale.get(calendarSchedule ? "Schedule" : "Product content")),
            if (uploadFile && _productContentFiles.length > 0)
              Column(
                  children: _productContentFiles
                      .map((file) => Card(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Container(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.5, bottom: 2.5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                SizedBox(width: 10.0, height: 10.0),
                                if (_uploadingFiles.contains(file.path)) SizedBox(child: CircularProgressIndicator(), height: 24.0, width: 24.0),
                                if (!_uploadingFiles.contains(file.path)) Icon(getFileTypeIcon(file.path), color: Colors.black87, size: 30.0),
                                SizedBox(width: 10.0, height: 10.0),
                                Expanded(
                                  child: Text(
                                    RegExp(r'^(.+/)(.+)$').firstMatch(file.path).group(2),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                IconButton(onPressed: () => _removeFileContent(file), icon: Icon(Icons.highlight_remove_outlined, color: Colors.redAccent))
                              ]))))
                      .toList()),
            if (uploadFile) RaisedButton.icon(onPressed: _uploadingFiles.isNotEmpty ? null : _uploadFilePressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.attachment_outlined, color: Colors.white), label: Text(_productContentFiles.length == 0 ? Locale.get("Select content") : Locale.get("Reselect"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            if (calendarSchedule)
              GestureDetector(
                onTap: () => _selectDateTime('from'),
                child: Card(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(Locale.get("Available from")), Text(timestamp2String(_fromUntilDateTime['from']), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent))],
                      ),
                    )),
              ),
            if (calendarSchedule)
              GestureDetector(
                onTap: () => _selectDateTime('until'),
                child: Card(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(Locale.get("Available until")), Text(timestamp2String(_fromUntilDateTime['until']), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent))],
                      ),
                    )),
              ),
            if (calendarSchedule)
              GestureDetector(
                onTap: _selectTimeSlots,
                child: Card(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(Locale.get("Available time slots")), Text(Locale.get("${Locale.REPLACE} selected", _countTimeSlots().toString()), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent))]),
                  ),
                ),
              ),
            getSectionSplitter(Locale.get("Proceed with this product")),
            RaisedButton.icon(onPressed: _createOrUpdateProductPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.upload_file, color: Colors.white), label: Text(_product == null ? "CREATE" : "UPDATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            if (_product != null && [Job.BUSINESS_OWNER_ROLE, Job.INDIVIDUAL_ENTREPRENEUR_ROLE].contains(_product.businessPage.role) && !_product.published)
              RaisedButton.icon(onPressed: _publishProductPressed, color: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.public, color: Colors.white), label: Text("PUBLISH", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            if (_product != null && [Job.BUSINESS_OWNER_ROLE, Job.INDIVIDUAL_ENTREPRENEUR_ROLE].contains(_product.businessPage.role) && _product.published)
              RaisedButton.icon(onPressed: _unpublishProductPressed, color: Colors.deepOrange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.public_off, color: Colors.white), label: Text("UNPUBLISH", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }

  void _categorySelected(int newCategoryId) {
    setState(() {
      _selectedCategoryId = newCategoryId;
    });
  }

  void _selectTimeSlots() async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => AvailableTimePickerModalView(_productAvailableTimeSlots, _fromUntilDateTime['from'], _fromUntilDateTime['until']));
    setState(() {});
  }

  int _countTimeSlots() {
    var count = 0;
    _productAvailableTimeSlots.forEach((key, value) {
      count += value.length;
    });
    return count;
  }

  Widget _getProductImage() {
    try {
      return Image.memory(_categories[_selectedCategoryId].pictureBlob, width: 20);
    } catch (e) {
      return Icon(Icons.arrow_drop_down);
    }
  }

  void _selectDateTime(String key) async {
    int timestamp;
    try {
      var now = DateTime.now();
      var oneYearFromNow = DateTime(now.year + 1, now.month, now.day, now.hour, now.minute, now.second, now.millisecond, now.microsecond);
      var res = await showDatePicker(
        context: context,
        initialDate: _fromUntilDateTime['from'] > 0 ? DateTime.fromMillisecondsSinceEpoch(_fromUntilDateTime['from']) : now,
        firstDate: key == 'until' && _fromUntilDateTime['from'] > 0 ? DateTime.fromMillisecondsSinceEpoch(_fromUntilDateTime['from']) : now,
        lastDate: key == 'from' && _fromUntilDateTime['until'] > 0 ? DateTime.fromMillisecondsSinceEpoch(_fromUntilDateTime['until']) : oneYearFromNow,
      );
      timestamp = res.millisecondsSinceEpoch;
    } catch (_) {
      return null;
    }

    try {
      var now = TimeOfDay.now();
      var res = await showTimePicker(context: context, initialTime: now);

      var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
      timestamp = DateTime(dt.year, dt.month, dt.day, res.hour, res.minute).millisecondsSinceEpoch;
    } catch (_) {
      return null;
    }

    if (_fromUntilDateTime['from'] > 0 && _fromUntilDateTime['until'] > 0) {
      if (_fromUntilDateTime['from'] > _fromUntilDateTime['until']) {
        if (key == 'from')
          _fromUntilDateTime['until'] = _fromUntilDateTime['from'];
        else
          _fromUntilDateTime['from'] = _fromUntilDateTime['until'];
      }
    }

    setState(() {
      _productAvailableTimeSlots.clear();
      _fromUntilDateTime[key] = timestamp;
    });
  }

  void _onProductTypeChanged(ProductDeliveryType newProductDeliveryType) {
    setState(() {
      _selectedProductDeliveryType = newProductDeliveryType;
    });

    if (_selectedProductDeliveryType == ProductDeliveryType.FILE_DOWNLOADABLE || _selectedProductDeliveryType == ProductDeliveryType.FILE_STREAMED) {
      toast(Locale.get('Please specify the content (attachment files) for this product'));
    } else if (_selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_FACE_TO_FACE || _selectedProductDeliveryType == ProductDeliveryType.SCHEDULED_ONLINE_CALL) {
      toast(Locale.get('Please specify your available time slots for this product'));
    }
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

  void _createOrUpdateProductPressed() async {
    double price = double.tryParse(_priceTextController.text) ?? double.nan;
    if (_titleTextController.text.length < 2) {
      await toast(Locale.get("Product title must not be shorter than two characters!"));
      return;
    } else if (price == double.nan) {
      _priceTextController.text = "0";
      await toast(Locale.get("Please check the price value!"));
      return;
    } else if (_descriptionTextController.text.length == 0) {
      await toast(Locale.get("Product description must be at least one character!"));
      return;
    } else if (_productImageBytes == null) {
      await toast(Locale.get("Please upload a feature image for the product!"));
      return;
    } else if (_productTypes[_selectedProductDeliveryType].item1.toLowerCase().contains('file') && _productContentFiles.length < 1) {
      await toast(Locale.get('At least one attachment (file) required for a product of type - ${Locale.REPLACE}', _productTypes[_selectedProductDeliveryType].item1));
      return;
    } else if (_productTypes[_selectedProductDeliveryType].item1.toLowerCase().contains('schedule') && _productAvailableTimeSlots.length == 0) {
      await toast(Locale.get('At least one available time slot required for a product of type - ${Locale.REPLACE}', _productTypes[_selectedProductDeliveryType].item1));
      return;
    }

    Map<String, dynamic> contents = {'ids': <int>[]};
    bool success = true;

    setState(() {
      for (File localFile in _productContentFiles) _uploadingFiles.add(localFile.path);
    });

    if (_productTypes[_selectedProductDeliveryType].item1.toLowerCase().contains('file')) {
      // todo add upload progressbar
      for (File localFile in _productContentFiles) {
        var fileName = path.basename(localFile.path);
        var tp = await grpcCreateNewContent(AppUser.sessionKey, Content.create(fileName, "", ""));
        success &= tp.item1;
        if (success) {
          var id = tp.item2;
          var uploadedFile = await DriveHelper.uploadFile(fileName, localFile);
          success &= uploadedFile != null;
          if (success) {
            grpcUpdateContent(AppUser.sessionKey, Content.create(fileName, uploadedFile.item1, uploadedFile.item2, id: id));
            contents['ids'].add(id);
            setState(() {
              _uploadingFiles.remove(localFile.path);
            });
          }
        }
      }
    } else if (_productTypes[_selectedProductDeliveryType].item1.toLowerCase().contains('schedule')) {
      Map<String, List<int>> availableTimeSlots = new Map<String, List<int>>();
      for (String key in _productAvailableTimeSlots.keys) {
        availableTimeSlots[key] = _productAvailableTimeSlots[key].toList();
      }
      contents = {'from': _fromUntilDateTime['from'], 'until': _fromUntilDateTime['until'], 'slots': availableTimeSlots};
    }

    if (_product == null)
      success = await grpcCreateProduct(AppUser.sessionKey, _businessPage, Product.create(_titleTextController.text, _selectedProductDeliveryType, _categories[_selectedCategoryId], _productImageBytes, _businessPage, price, _selectedCurrency, _descriptionTextController.text, contents));
    else
      success = await grpcUpdateProduct(AppUser.sessionKey, Product.create(_titleTextController.text, _selectedProductDeliveryType, _categories[_selectedCategoryId], _productImageBytes, _businessPage, price, _selectedCurrency, _descriptionTextController.text, contents, id: _product.id));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _uploadFilePressed() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        setState(() {
          _productContentFiles = result.paths.map((path) => File(path)).toList();
        });
      } else {
        toast(Locale.get("Selection cancelled!"));
      }
    } catch (e) {
      print(e);
    }
  }

  void _removeFileContent(File file) async {
    setState(() {
      _productContentFiles.remove(file);
    });
  }

  void _publishProductPressed() async {
    // if (_product.published) return
    grpcPublishProduct(AppUser.sessionKey, _product.id).then((isSuccess) {
      if (isSuccess) {
        Navigator.of(context).pop();
      } else {
        toast(Locale.get('Problem with product content, please try again!'));
      }
    });
  }

  void _unpublishProductPressed() async {
    // if (!_product.published) return;
    grpcUnpublishProduct(AppUser.sessionKey, _product.id).then((isSuccess) {
      if (isSuccess) {
        Navigator.of(context).pop();
      } else {
        toast(Locale.get('Problem with product content, please try again!'));
      }
    });
  }
}
