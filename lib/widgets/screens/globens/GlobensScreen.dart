import 'dart:math';

import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class GlobensScreen extends StatefulWidget {
  @override
  _GlobensScreenState createState() => _GlobensScreenState();
}

class _GlobensScreenState extends State<GlobensScreen> {
  Widget _header;
  List<ProductCategory> _categories = [];
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part (i.e., header, categories)
    _header = Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: RichText(
        text: TextSpan(children: <TextSpan>[new TextSpan(text: "Globens", style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Colors.blueAccent)), new TextSpan(text: "!", style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Colors.lightGreen))]),
      ),
    );

    // 2. dynamic part : change body (i.e., ad products) from server
    _fetchCategoriesAndAdProducts();
  }

  @override
  Widget build(BuildContext context) {
    int categoryRows = (_categories.length / 2).ceil();
    int productRows = (_products.length / 2).ceil();

    return ListView.builder(
      itemCount: 3 + categoryRows + 1 + productRows,
      itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
    );
  }

  Future<void> _fetchCategoriesAndAdProducts() async {
    final Tuple2<bool, List<ProductCategory>> tp1 = await grpcFetchProductCategories();
    bool success = tp1.item1;
    List<ProductCategory> categories = tp1.item2;
    if (success) {
      setState(() {
        _categories = categories;
      });
    }

    final Tuple2<bool, List<Product>> tp2 = await grpcFetchNextKProducts(k: 50);
    success = tp2.item1;
    List<Product> products = tp2.item2;

    if (success) {
      setState(() {
        _products = products;
      });
    }
  }

  Widget _getListViewItem(BuildContext context, int index) {
    int categoryRows = (_categories.length / 2).ceil();
    Size screenSize = MediaQuery.of(context).size;

    if (index >= 3 + categoryRows + 1) {
      // products section
      index -= 3 + categoryRows + 1;
      return _buildProductRow(context, index, screenSize);
    } else if (index == 3 + categoryRows) {
      // mid splitter part
      return getSectionSplitter("Top hit products");
    } else if (index >= 3) {
      // categories section
      index -= 3;
      return _buildCategoryRow(context, index, screenSize);
    } else if (index == 2) {
      // top splitter part
      return getSectionSplitter("Product categories");
    } else if (index == 1) {
      // top profile widget
      return InkWell(
        onTap: () => _onProfileWidgetTap(context),
        child: getUserProfileWidget(),
      );
    } else {
      return _header;
    }
  }

  InkWell _buildCategoryItem(BuildContext context, ProductCategory category, Size screenSize) {
    return InkWell(
      onTap: () => _onCategoryTap(context, category),
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          color: Colors.white,
          elevation: 2.5,
          child: new Container(
            width: screenSize.width * 0.45,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    category.name,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.blueGrey,
                    height: 4.0,
                  ),
                  ...List<Text>.generate(
                      min(2, category.examples.length),
                      (index) => Text(
                            "• ${shorten(category.examples[index], 15, ellipsize: true)}",
                            style: TextStyle(fontSize: 11.0),
                          )),
                  Text(
                    "• etc.",
                    style: TextStyle(fontSize: 11.0),
                  )
                ]),
                Container(width: 50, height: 50, child: Image.memory(category.pictureBlob))
              ],
            ),
          )),
    );
  }

  Row _buildCategoryRow(BuildContext context, int index, Size screenSize) {
    int categoryIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildCategoryItem(context, _categories[categoryIndex], screenSize)]);
    if (categoryIndex < _categories.length - 1) // two elements in one row
      row.children.add(_buildCategoryItem(context, _categories[categoryIndex + 1], screenSize));

    return row;
  }

  InkWell _buildProductItem(BuildContext context, Product product, Size screenSize) {
    double iconWH = screenSize.width * 0.45;

    return InkWell(
        onTap: () => _onProductTap(context, product),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            elevation: 1.0,
            child: new Container(
              width: iconWH,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.memory(
                        product.pictureBlob,
                        fit: BoxFit.cover,
                        height: iconWH,
                      )),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20.0,
                          child: Text(
                            product.name,
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Text(
                          "by `${product.businessPage.title}`",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.0, color: Colors.blueGrey),
                        ),
                        Text(
                          "${product.priceStr}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.deepOrange),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Row _buildProductRow(BuildContext context, int index, Size screenSize) {
    int productIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildProductItem(context, _products[productIndex], screenSize)]);
    if (productIndex < _products.length - 1) // two elements in one row
      row.children.add(_buildProductItem(context, _products[productIndex + 1], screenSize));

    return row;
  }

  void _onProfileWidgetTap(BuildContext context) {}

  void _onCategoryTap(BuildContext context, ProductCategory category) async {
    await Navigator.of(context).pushNamed('/category_products', arguments: category);
  }

  void _onProductTap(BuildContext context, Product product) async {
    // todo show product details and buying part
    // await showModalBottomSheet(context: context, builder: (context) => ProductViewerModalView(null, product));
  }
}
