import 'dart:wasm';

import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../modal_views/product viewer modal view.dart';

class GlobensScreen extends StatefulWidget {
  @override
  _GlobensScreenState createState() => _GlobensScreenState();
}

class _GlobensScreenState extends State<GlobensScreen> {
  List<Widget> _header = [];
  List<ProductCategory> _categories = [];
  List<Product> _products = [];


  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part (i.e., header, categories)
    _header = [getTitleWidget("Globens", textColor: Colors.black)];
    _categories = [
      ProductCategory.create("education", SvgPicture.asset("assets/education.svg")),
      ProductCategory.create("consulting", SvgPicture.asset("assets/consulting.svg")),
      ProductCategory.create("vacancies", SvgPicture.asset("assets/job.svg")),
      ProductCategory.create("others", SvgPicture.asset("assets/others.svg"))
    ];

    // 2. dynamic part : change body (i.e., ad products) from server
    _fetchAvailableProducts();
  }

  @override
  Widget build(BuildContext context) {
    int categoryRows = (_categories.length / 2).round();
    categoryRows += _categories.length % 2;
    int productRows = (_products.length / 2).round();
    productRows += _products.length % 2;

    return ListView.builder(
      itemCount: _header.length + 1 + categoryRows + 2 + productRows,
      itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
    );
  }


  Future<void> _fetchAvailableProducts() async {
    Tuple2<bool, List> product = await grpcFetchNextKProducts(AppUser.sessionKey, k: 10);
    bool success = product.item1;
    List<Product> products = product.item2;

    if (success) {
      setState(() {
        _products = products;
      });
    }
  }

  Widget _getListViewItem(BuildContext context, int index) {
    int categoryRows = (_categories.length / 2).round();
    categoryRows += _categories.length % 2;

    if (index >= _header.length + 1 + categoryRows + 2) {
      // products section
      index -= _header.length + 1 + categoryRows + 2;
      return _buildProductItem(context, index);
    } else if (index >= _header.length + 1 + categoryRows) {
      // mid section
      index -= _header.length + 1 + categoryRows;
      if (index == 0)
        return Divider();
      else
        return Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Explore  more products",
              style: TextStyle(fontSize: 20),
            ));
    } else if (index >= _header.length + 1) {
      // categories section
      index -= _header.length + 1;
      return _buildCategoryItem(context, index);
    } else if (index >= _header.length) {
      // header vs. categories divider
      return Divider();
    } else {
      return _header[index];
    }
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    int newIndex = index * 2;

    if (newIndex == _categories.length - 1) {
      // single element row
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onCategoryTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _categories[newIndex].text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: _categories[newIndex].icon)
                    ],
                  ),
                )
            ),
          )
        ],
      );
    } else {
      // two elements in one row
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onCategoryTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _categories[newIndex].text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: _categories[newIndex].icon)
                    ],
                  ),
                )
            ),
          ),
          InkWell(
            onTap: () => _onCategoryTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _categories[newIndex + 1].text,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: _categories[newIndex + 1].icon)
                    ],
                  ),
                )
            ),
          )
        ],
      );
    }
  }

  Widget _buildProductItem(BuildContext context, int index) {
    int newIndex = index * 2;

    if (newIndex == _products.length - 1) {
      // single element row
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onProductTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _products[newIndex].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: Image.memory(_products[newIndex].pictureBlob))
                    ],
                  ),
                )
            ),
          )
        ],
      );
    } else {
      // two elements in one row
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _onProductTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _products[newIndex].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: Image.memory(_products[newIndex].pictureBlob))
                    ],
                  ),
                )
            ),
          ),
          InkWell(
            onTap: () => _onProductTap(context, index),
            child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                elevation: 5.0,
                child: new Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 75,
                        height: 50,
                        child: Text(
                          _products[newIndex + 1].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(width: 50, height: 50, child: Image.memory(_products[newIndex + 1].pictureBlob))
                    ],
                  ),
                )
            ),
          )
        ],
      );
    }
  }


  void _onCategoryTap(BuildContext context, int index) {
    // todo screen ==> specific category products
  }

  void _onProductTap(BuildContext context, int index) async {
    // await showModalBottomSheet(context: context, builder: (context) => ProductViewerModalView());
  }
}
