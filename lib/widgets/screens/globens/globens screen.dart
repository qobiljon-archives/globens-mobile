import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/individual%20item%20widgets/categories_grid_view.dart';
import 'package:globens_flutter_client/widgets/individual%20item%20widgets/products_grid_view.dart';
import 'package:tuple/tuple.dart';

class GlobensScreen extends StatefulWidget {
  @override
  GlobensScreenState createState() => GlobensScreenState();
}

class GlobensScreenState extends State<GlobensScreen> {
  List<Product> _products = [];
  bool isProductsVisible = false;

  @override
  void initState() {
    super.initState();
    _fetchAvailableProducts();
  }

  @override
  Widget build(BuildContext context) {
    final heightOfScreen = MediaQuery.of(context).size.height;
    final widthOftheScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [getTitleWidget("Globens"), Icon(Icons.search)],
          ),
          Divider(),
          CategoriesGridView(
            screenWidth: widthOftheScreen,
            screenHeight: heightOfScreen,
          ),
          Divider(),
          Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Explore  more products",
                style: TextStyle(fontSize: 20),
              )),
          ProductsGridView(
            screenWidth: widthOftheScreen,
            screenHeight: heightOfScreen,
            products: _products,
          ),
          Divider(),
        ],
      ),
    );
  }

  void _fetchAvailableProducts() async {
    Tuple2<bool, List> product = await grpcFetchNextKProducts(AppUser.sessionKey);
    bool success = product.item1;
    List<Product> products = product.item2;

    if (success) {
      setState(() {
        _products = products;
      });
    }
  }
}
