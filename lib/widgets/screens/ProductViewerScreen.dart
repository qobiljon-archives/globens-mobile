import 'package:globens_flutter_client/widgets/modal_views/PPOTSSModalView.dart';
import 'package:globens_flutter_client/widgets/modal_views/PPWTSSModalView.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'ProductPurchaseScreen.dart';
import 'dart:convert';

class ProductViewerScreen extends StatefulWidget {
  static const String route_name = '/product_viewer_screen';

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
        body: ListView(
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
                            child: Image.memory(_product.pictureBlob, fit: BoxFit.cover),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton.icon(onPressed: _openTryTimeSlotSelector, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.checkroom, color: Colors.white), label: Text("TRY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    RaisedButton.icon(onPressed: _openSignUpTimeSlotSelector, color: Colors.blueAccent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))), icon: Icon(Icons.shopping_bag_outlined, color: Colors.white), label: Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                )),
            /*Card(
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Repeating"),
                  Switch(
                      value: _repeating,
                      onChanged: (value) {
                        setState(() {
                          _repeating = value;
                        });
                      })
                ]),
              ),
            ),*/
          ],
        ));
  }

  void _openTryTimeSlotSelector() async {
    // todo change
    var _productAvailableTimeSlots = <String, Set<int>>{};
    var tsFrom = DateTime.now().millisecondsSinceEpoch;
    var tsUntil = (DateTime.now().add(Duration(days: 30))).millisecondsSinceEpoch;
    await showModalBottomSheet(context: context, builder: (context) => PPOTSSModalView(_product));
  }

  void _openSignUpTimeSlotSelector() async {
    // todo change
    var _productAvailableTimeSlots = <String, Set<int>>{};
    var tsFrom = DateTime.now().millisecondsSinceEpoch;
    var tsUntil = (DateTime.now().add(Duration(days: 30))).millisecondsSinceEpoch;
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => PPWTSSModalView(_productAvailableTimeSlots, tsFrom, tsUntil));
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _purchaseProductPressed() async {
    await Navigator.of(context).pushNamed(ProductPurchaseScreen.route_name, arguments: _product);
  }
}
