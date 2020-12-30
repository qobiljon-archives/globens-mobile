import 'package:globens_flutter_client/widgets/modal_views/product%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

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
    _header = [
      Container(
        margin: EdgeInsets.only(top: 10.0, left: 10.0),
        child: RichText(
          text: TextSpan(children: <TextSpan>[new TextSpan(text: "Globens", style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Colors.blueAccent)), new TextSpan(text: "!", style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Colors.lightGreen))]),
        ),
      ),
    ];
    _categories = [
      ProductCategory.create("Education", ["Korean", "Programming", "etc"], SvgPicture.asset("assets/education.svg")),
      ProductCategory.create("Consulting", ["Legal matters", "Visa", "etc"], SvgPicture.asset("assets/consulting.svg")),
      ProductCategory.create("Vacancies", ["Engineering", "Freelancing", "etc"], SvgPicture.asset("assets/job.svg")),
      ProductCategory.create("Others", ["1-1 services", "Delivery", "etc"], SvgPicture.asset("assets/others.svg"))
    ];

    // 2. dynamic part : change body (i.e., ad products) from server
    _fetchAdProducts();
  }

  @override
  Widget build(BuildContext context) {
    int categoryRows = (_categories.length / 2).round();
    categoryRows += _categories.length % 2;
    int productRows = (_products.length / 2).round();
    productRows += _products.length % 2;

    return ListView.builder(
      itemCount: _header.length + 2 + categoryRows + 1 + productRows,
      itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
    );
  }

  Future<void> _fetchAdProducts() async {
    Tuple2<bool, List> product = await grpcFetchNextKProducts(AppUser.sessionKey, k: 20);
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
    Size screenSize = MediaQuery.of(context).size;

    if (index >= _header.length + 2 + categoryRows + 1) {
      // products section
      index -= _header.length + 2 + categoryRows + 1;
      return _buildProductRow(context, index, screenSize);
    } else if (index == _header.length + 2 + categoryRows) {
      // mid splitter part
      return getSectionSplitter("Top hit products");
    } else if (index >= _header.length + 2) {
      // categories section
      index -= _header.length + 2;
      return _buildCategoryRow(context, index, screenSize);
    } else if (index == _header.length + 1) {
      // top splitter part
      return getSectionSplitter("Product categories");
    } else if (index == _header.length) {
      // top profile widget
      return InkWell(
        onTap: () => _onProfileWidgetTap(context),
        child: getUserProfileWidget(),
      );
    } else {
      return _header[index];
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      height: 4.0,
                    ),
                    Text(
                      "• ${category.examples[0]}",
                      style: TextStyle(fontSize: 9.0),
                    ),
                    Text(
                      "• ${category.examples[1]}",
                      style: TextStyle(fontSize: 9.0),
                    ),
                    Text(
                      "• ${category.examples[2]}",
                      style: TextStyle(fontSize: 9.0),
                    ),
                  ],
                ),
                Container(width: 50, height: 50, child: category.icon)
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
    ClipRRect image = ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Image.memory(
          product.pictureBlob,
          fit: BoxFit.fill,
        ));

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
            width: screenSize.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                image,
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                      ),
                      Text(
                        "${product.priceStr}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Row _buildProductRow(BuildContext context, int index, Size screenSize) {
    int productIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [_buildProductItem(context, _products[productIndex], screenSize)]);
    if (productIndex < _products.length - 1) // two elements in one row
      row.children.add(_buildProductItem(context, _products[productIndex + 1], screenSize));

    return row;
  }

  void _onProfileWidgetTap(BuildContext context) {}

  void _onCategoryTap(BuildContext context, ProductCategory category) async {
    // todo screen ==> specific category products
  }

  void _onProductTap(BuildContext context, Product product) async {
    // await showModalBottomSheet(context: context, builder: (context) => ProductViewerModalView(null, product));
  }
}
