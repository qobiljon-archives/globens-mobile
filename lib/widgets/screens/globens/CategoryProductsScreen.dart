import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatefulWidget {
  static String route_name = '/category_products';
  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  Widget _header;
  ProductCategory _category;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();

    _header = Row(children: [
      IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: _onBackButtonPressed,
      ),
      getTitleWidget('Category', textColor: Colors.black, margin: EdgeInsets.all(0))
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _category = ModalRoute.of(context).settings.arguments as ProductCategory;
    grpcFetchNextKProducts(filterDetails: FilterDetails()..categoryId = _category.id).then((tp) {
      bool success = tp.item1;
      List<Product> products = tp.item2;

      if (success) {
        setState(() {
          this._products = products;
        });
      }
    });

    setState(() {
      _header = Row(children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: _onBackButtonPressed,
        ),
        getTitleWidget(shorten(_category.name, 15, ellipsize: true), textColor: Colors.black, margin: EdgeInsets.all(0))
      ]);

      _products = _products;
    });
  }

  @override
  Widget build(BuildContext context) {
    int productRows = (_products.length / 2).ceil();

    return Scaffold(
      body: ListView.builder(
        itemCount: 2 + productRows,
        itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    Size screenSize = MediaQuery.of(context).size;

    if (index >= 2) {
      // products section
      index -= 2;
      return _buildProductRow(context, index, screenSize);
    } else if (index == 1) {
      // divider
      return getSectionSplitter("Related products");
    } else {
      return _header;
    }
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
          )),
    );
  }

  Row _buildProductRow(BuildContext context, int index, Size screenSize) {
    int productIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildProductItem(context, _products[productIndex], screenSize)]);
    if (productIndex < _products.length - 1) // two elements in one row
      row.children.add(_buildProductItem(context, _products[productIndex + 1], screenSize));

    return row;
  }

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _onProductTap(BuildContext context, Product product) async {
    // todo show product details and buying part
    Navigator.of(context).pushNamed('/product_purchase', arguments: product);
  }
}
