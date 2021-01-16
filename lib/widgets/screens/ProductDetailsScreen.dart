import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:bootpay_api/bootpay_api.dart';
import 'package:bootpay_api/model/extra.dart';
import 'package:bootpay_api/model/item.dart';
import 'package:bootpay_api/model/payload.dart';
import 'package:bootpay_api/model/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
  static const _weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  static const _calendarStartHour = 8;
  static const List<Tuple2<String, String>> _productTypes = <Tuple2<String, String>>[
    Tuple2('Downloadable files', 'assets/product_type_downloadable.png'),
    Tuple2('Streamed files', 'assets/product_type_streamed.png'),
    Tuple2('Scheduled face-to-face meeting', 'assets/product_type_scheduled.png'),
    Tuple2('Scheduled online call', 'assets/product_type_scheduled.png'),
  ];

  Product _product;
  BusinessPage _businessPage;
  Uint8List _productImageBytes;

  Map<int, ProductCategory> _categories = Map<int, ProductCategory>();

  int _selectedCategoryId;
  int _selectedProductTypeIndex;
  Currency _selectedCurrency;
  List<File> _productContentFiles = <File>[];
  Map<String, Set<int>> _productAvailableTimeSlots = Map<String, Set<int>>();

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

    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    if (arguments.containsKey('product') && arguments['product'] is Product) {
      _product = arguments['product'] as Product;
      _businessPage = _product.businessPage;
    } else
      _businessPage = arguments['businessPage'] as BusinessPage;
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
                            if (_product == null)
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
                            if (_product != null)
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                                child: Image.memory(_product.pictureBlob, fit: BoxFit.cover),
                              ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                "${_product == null ? Product.price2string(double.tryParse(_priceTextController.text) ?? 0.0, _selectedCurrency) : _product.priceStr}",
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
                              if (_product == null)
                                Container(
                                  height: 20.0,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: TextField(controller: _titleTextController, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), decoration: InputDecoration(labelText: "Product name", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., Yoga training 24/7", border: InputBorder.none)),
                                ),
                              if (_product != null)
                                Container(
                                  height: 20.0,
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(_product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              if (_product == null)
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Flexible(
                          child: Card(
                              margin: EdgeInsets.only(right: 20.0),
                              child: Container(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0), child: TextField(controller: _priceTextController, keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), decoration: InputDecoration(labelText: "Price", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., 1000", border: InputBorder.none))))),
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
              if (_product == null)
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
              if (_product == null)
                Card(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextField(controller: _descriptionTextController, minLines: 10, maxLines: 10, keyboardType: TextInputType.multiline, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), decoration: InputDecoration(labelText: "Product description", labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: "e.g., the best product.", border: InputBorder.none)))),
              if (_product != null)
                Card(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          _product.description,
                          maxLines: 10,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                        ))),
              if (_product == null) getSectionSplitter("Product content"),
              if (_product == null)
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
              if (_product == null && [0, 1].contains(_selectedProductTypeIndex) && _productContentFiles.length > 0)
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
              if (_product == null && [0, 1].contains(_selectedProductTypeIndex)) RaisedButton.icon(onPressed: _uploadFilePressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.attachment_outlined, color: Colors.white), label: Text(_productContentFiles.length == 0 ? "SELECT CONTENT" : "RESELECT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
              if (_product == null && [2, 3].contains(_selectedProductTypeIndex))
                Card(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Container(
                    child: GridView.count(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: _weekdays.length + 1,
                      children: List<Widget>.generate((24 - _calendarStartHour + 1) * (_weekdays.length + 1), (index) {
                        int col = index % (_weekdays.length + 1);
                        int row = index ~/ (_weekdays.length + 1);

                        if (row == 0) {
                          if (col == 0)
                            return TextButton(onPressed: _calendarMasterButtonPressed, child: Text('*', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)));
                          else {
                            String weekday = _weekdays[col - 1];
                            return TextButton(onPressed: () => _calendarWeekdayPressed(weekday), child: Text(weekday, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)));
                          }
                        } else {
                          int hour = row + _calendarStartHour - 1;

                          if (col == 0)
                            return TextButton(onPressed: () => _calendarHourPressed(hour), child: Text('${hour < 13 ? hour : hour % 12}\n${hour < 12 ? "AM" : "PM"}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)));
                          else {
                            String weekday = _weekdays[col - 1];
                            bool selected = _productAvailableTimeSlots.containsKey(weekday) && _productAvailableTimeSlots[weekday].contains(hour);
                            return IconButton(onPressed: () => _calendarSlotPressed(weekday, hour), icon: selected ? Icon(Icons.check, color: Colors.green) : Icon(Icons.block, color: Colors.grey), padding: EdgeInsets.zero);
                          }
                        }
                      }),
                    ),
                  ),
                ),
              if (_product != null && _product.productType.toLowerCase().contains('schedule')) Text(Utf8Decoder().convert(_product.productContent)),
              getSectionSplitter("Proceed with this product"),
              if (_product == null) Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _createProductPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.upload_file, color: Colors.white), label: Text("CREATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
              if (_product != null) Container(margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0), child: RaisedButton.icon(onPressed: _purchaseProductPressed, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.shopping_bag_outlined, color: Colors.white), label: Text("PURCHASE FOR ${_product.priceStr}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
            ],
          ),
        ));
  }

  void _calendarMasterButtonPressed() {
    bool completelySelected = _productAvailableTimeSlots.length == _weekdays.length;
    for (String weekday in _weekdays)
      if (completelySelected)
        completelySelected &= _productAvailableTimeSlots[weekday].length == 24 - _calendarStartHour;
      else
        break;

    _productAvailableTimeSlots.clear();
    if (!completelySelected) for (String weekday in _weekdays) _productAvailableTimeSlots[weekday] = List<int>.generate(24 - _calendarStartHour, (index) => _calendarStartHour + index).toSet();

    setState(() {});
  }

  void _calendarHourPressed(int hour) {
    bool hourCompletelySelected = _productAvailableTimeSlots.length == _weekdays.length;
    for (String weekday in _weekdays)
      if (hourCompletelySelected)
        hourCompletelySelected &= _productAvailableTimeSlots.containsKey(weekday) && _productAvailableTimeSlots[weekday].contains(hour);
      else
        break;

    if (hourCompletelySelected) {
      // remove
      for (String weekday in _weekdays) {
        _productAvailableTimeSlots[weekday].remove(hour);
        if (_productAvailableTimeSlots[weekday].isEmpty) _productAvailableTimeSlots.remove(weekday);
      }
    } else {
      // insert
      for (String weekday in _weekdays)
        if (_productAvailableTimeSlots.containsKey(weekday))
          _productAvailableTimeSlots[weekday].add(hour);
        else
          _productAvailableTimeSlots[weekday] = <int>[hour].toSet();
    }

    setState(() {});
  }

  void _calendarWeekdayPressed(final String day) {
    bool dayCompletelySelected = _productAvailableTimeSlots.containsKey(day);
    for (int hour = _calendarStartHour; hour < 24; hour++)
      if (dayCompletelySelected)
        dayCompletelySelected &= _productAvailableTimeSlots[day].contains(hour);
      else
        break;

    if (dayCompletelySelected) {
      // remove
      _productAvailableTimeSlots.remove(day);
    } else {
      // insert
      if (_productAvailableTimeSlots.containsKey(day))
        for (int hour = _calendarStartHour; hour < 24; hour++) _productAvailableTimeSlots[day].add(hour);
      else
        _productAvailableTimeSlots[day] = List<int>.generate(24 - _calendarStartHour, (index) => _calendarStartHour + index).toSet();
    }
    setState(() {});
  }

  void _calendarSlotPressed(String weekday, int hour) {
    bool selected = _productAvailableTimeSlots.containsKey(weekday) && _productAvailableTimeSlots[weekday].contains(hour);
    if (selected) {
      // remove
      _productAvailableTimeSlots[weekday].remove(hour);
      if (_productAvailableTimeSlots[weekday].isEmpty) _productAvailableTimeSlots.remove(weekday);
    } else {
      // insert
      if (_productAvailableTimeSlots.containsKey(weekday))
        _productAvailableTimeSlots[weekday].add(hour);
      else
        _productAvailableTimeSlots[weekday] = <int>[hour].toSet();
    }
    setState(() {});
  }

  void _onProductTypeChanged(int newIndex) {
    setState(() {
      _selectedProductTypeIndex = newIndex;
    });

    if (_productTypes[newIndex].item1.toLowerCase().contains('schedule')) {
      toast('Please specify your available time slots for this product');
    } else if (_productTypes[newIndex].item1.toLowerCase().contains('file')) {
      toast('Please specify the content (attachment files) for this product');
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

  void _createProductPressed() async {
    double price = double.tryParse(_priceTextController.text) ?? double.nan;
    if (_titleTextController.text.length < 2) {
      await toast("Product title must not be shorter than two characters!");
      return;
    } else if (price == double.nan) {
      _priceTextController.text = "0";
      await toast("Please check the price value!");
      return;
    } else if (_descriptionTextController.text.length == 0) {
      await toast("Product description must be at least one character!");
      return;
    } else if (_productImageBytes == null) {
      await toast("Please upload a feature image for the product!");
      return;
    } else if (_productTypes[_selectedProductTypeIndex].item1.toLowerCase().contains('file') && _productContentFiles.length < 1) {
      await toast('At least one attachment (file) required for a product of type - "${_productTypes[_selectedProductTypeIndex].item1}"');
      return;
    } else if (_productTypes[_selectedProductTypeIndex].item1.toLowerCase().contains('schedule') && _productAvailableTimeSlots.length == 0) {
      await toast('At least one available time slot required for a product of type - "${_productTypes[_selectedProductTypeIndex].item1}"');
      return;
    }

    Uint8List contentBytes;
    if (_productTypes[_selectedProductTypeIndex].item1.toLowerCase().contains('file')) {
      // content : zip file
      final directory = await getApplicationDocumentsDirectory();
      try {
        var file = File('${directory.path}/temp.zip');
        if (await file.exists()) await file.delete();
      } catch (e) {
        print('delete error : ${e.toString()}');
      }

      var encoder = ZipFileEncoder();
      encoder.create('${directory.path}/temp.zip');
      for (File file in _productContentFiles) encoder.addFile(file);
      encoder.close();

      try {
        var file = File('${directory.path}/temp.zip');
        contentBytes = await file.readAsBytes();
      } catch (e) {
        print('read error : ${e.toString()}');
      }
    } else if (_productTypes[_selectedProductTypeIndex].item1.toLowerCase().contains('schedule')) {
      // content : calendar json
      // content = json.encode(_productAvailableTimeSlots);
      Map<String, List<int>> contentForJson = new Map<String, List<int>>();
      for (String key in _productAvailableTimeSlots.keys) {
        contentForJson[key] = _productAvailableTimeSlots[key].toList();
      }
      contentBytes = JsonUtf8Encoder().convert(contentForJson);
    }

    if (contentBytes == null) {
      await toast('Problem with product content, please try again!');
      return;
    }

    bool success = await grpcCreateProduct(AppUser.sessionKey, _businessPage, Product.create(_titleTextController.text, _productTypes[_selectedProductTypeIndex].item1.toLowerCase(), _categories[_selectedCategoryId], _productImageBytes, _businessPage, price, _selectedCurrency, _descriptionTextController.text, contentBytes));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _purchaseProductPressed() async {
    // todo replace values with the product's details
    Item item1 = Item();
    item1.itemName = _product.name; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.unique = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = _product.price; // 상품의 가격

    List<Item> itemList = [item1];

    Payload payload = Payload();
    payload.applicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.androidApplicationId = '5b8f6a4d396fa665fdc2b5e8';
    payload.iosApplicationId = '5b8f6a4d396fa665fdc2b5e9';

    payload.pg = 'inicis';
    payload.methods = ['card', 'phone', 'vbank', 'bank'];
    payload.name = '테스트 상품';
    payload.price = _product.price; //정기결제시 0 혹은 주석
    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString();
    payload.params = {
      "callbackParam1": "value12",
      "callbackParam2": "value34",
      "callbackParam3": "value56",
      "callbackParam4": "value78",
    };
    //    payload.us

    User user = User();
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    user.phone = "010-4033-4678";
    user.addr = '서울시 동작구 상도로 222';

    Extra extra = Extra();
    extra.appScheme = 'bootpayFlutterSample';
    extra.quotas = [0, 2, 3];

    BootpayApi.request(
      context,
      payload,
      extra: extra,
      user: user,
      items: itemList,
      onDone: (String json) {
        print('--- onDone: $json');
      },
      onReady: (String json) {
        //flutter는 가상계좌가 발급되었을때  onReady가 호출되지 않는다. onDone에서 처리해주어야 한다.
        print('--- onReady: $json');
      },
      onCancel: (String json) {
        print('--- onCancel: $json');
      },
      onError: (String json) {
        print(' --- onError: $json');
      },
    );
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