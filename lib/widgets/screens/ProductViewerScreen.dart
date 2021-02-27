import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_archive/flutter_archive.dart' as ZipFile;
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'ProductPurchaseScreen.dart';
import 'dart:convert';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'dart:typed_data' show Uint8List;
import 'PurchasedProductContentsScreen.dart';
import 'package:archive/archive_io.dart';

class ProductViewerScreen extends StatefulWidget {
  static const String route_name = '/product_viewer_screen';
  List  _products;

  ProductViewerScreen();

  @override
  _ProductViewerScreenState createState() => _ProductViewerScreenState();
}

class _ProductViewerScreenState extends State<ProductViewerScreen> {
  Product _product;
  bool _repeating = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _product = ModalRoute.of(context).settings.arguments as Product;
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
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                              child: AspectRatio(aspectRatio: 1, child: Image.memory(_product.pictureBlob, fit: BoxFit.cover)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0, top: 10.0),
                              child: Text(
                                _product.priceStr,
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
                            child: Text(_product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent)),
                          ),
                        )
                      ],
                    ),
                  )),
              Card(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _product.description,
                        maxLines: 10,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                      ))),
              if (_product.productType.toLowerCase().contains('schedule')) Text(Utf8Decoder().convert(_product.productContent)),
              getSectionSplitter("Proceed with this product"),
              Container(
                  margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: RaisedButton.icon(
                      onPressed: _purchaseProductPressed,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                      label: Text("PURCHASE FOR ${_product.priceStr}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
              Container(
                  margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: RaisedButton.icon(
                      onPressed: _viewProductPressed,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.stream, color: Colors.white),
                      label: Text("VIEW/DOWNLOAD  PRODUCT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
            ],
          ),
        ));
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _purchaseProductPressed() async {
    await Navigator.of(context).pushNamed(ProductPurchaseScreen.route_name, arguments: _product);
  }

  void _viewProductPressed() async {
    Archive archive = ZipDecoder().decodeBytes(Uint8List.fromList(_product.productContent));
    final directory = await getApplicationDocumentsDirectory();
    List filesPaths = [];
    print(directory);
    for (final file in archive) {
      final filename = file.name;
      filesPaths.add(filename);
      print(filename);
      if (file.isFile) {
        final data = file.content as List<int>;
        File("/data/user/0/uz.globens" + "/" + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      }
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewScreen(filesPaths),));



  }

  Widget buildProductsList(){

  }
}
