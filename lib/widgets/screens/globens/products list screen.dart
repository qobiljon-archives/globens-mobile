import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20application%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/modal_views/product%20viewer%20modal%20view.dart';
import 'package:tuple/tuple.dart';

class ProductsListScreen extends StatefulWidget {
  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  List<Product> _products = [];
  List<Widget> _header = [];

  @override
  void initState() {
    super.initState();

    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          getTitleWidget("Products"),
        ],
      ),
    ];
    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Colors.blueAccent,
          ),
          itemCount: _header.length + _products.length,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index == 0)
      return _header[index];
    else {
      index -= _header.length;
      return _buildProductItem(context, index);
    }
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => _openProductDetails(context, index),
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    backgroundImage: MemoryImage(_products[index].pictureBlob),
                  ),
                )),
            GestureDetector(
              onTap: () => _openProductDetails(context, index),
              child: Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${_products[index].name}",
                      style: TextStyle(),
                    )),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: RaisedButton(
            onPressed: () => _onPurchase(context, index),
            child: Text("Purchase"),
          ),
        ),
      ],
    );
  }

  void _updateDynamicPart() async {
    Tuple2<bool, List<Product>> product = await grpcFetchNextKProducts(AppUser.sessionKey);
    bool success = product.item1;
    List<Product> products = product.item2;

    if (success) {
      setState(() {
        _products = products;
      });
    }
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onPurchase(BuildContext context, int index) async {
    //TODO: implement purchase functionality
  }

  void _openProductDetails(BuildContext context, index) async {
    //TODO  open product details
  }
}
