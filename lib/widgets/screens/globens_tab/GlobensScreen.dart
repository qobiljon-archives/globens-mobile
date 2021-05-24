import 'package:globens_flutter_client/widgets/screens/globens_tab/CategoryProductsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductViewerScreen.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:globens_flutter_client/entities/ProductCategory.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'dart:math';

class GlobensScreen extends StatefulWidget {
  final RootTabsScreenState rootTabsScreenState;

  GlobensScreen(this.rootTabsScreenState);

  @override
  _GlobensScreenState createState() => _GlobensScreenState();
}

class _GlobensScreenState extends State<GlobensScreen> {
  Widget _header;
  List<ProductCategory> _categories;
  List<Product> _products;
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController(initialRefresh: true);

    // 1. static part : set up common part (i.e., header, categories)
    _header = Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Image.asset('assets/globens_icon_transparent_bg.png', width: 24),
          RichText(text: new TextSpan(text: "lobens", style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Color.fromARGB(255, 3, 169, 243)))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int categoryRows = _categories == null ? 1 : (_categories.length / 2).ceil();
    int productRows = _products == null ? 1 : (_products.length / 2).ceil();

    return SafeArea(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(color: Colors.blue,),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle)
              body = Text("Pull up to load more");
            else if (mode == LoadStatus.loading)
              body = Text("Loading");
            else if (mode == LoadStatus.failed)
              body = Text("Load Failed! Click retry!");
            else if (mode == LoadStatus.canLoading)
              body = Text("release to load more");
            else
              body = Text("No more Data");
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: 3 + categoryRows + 1 + productRows,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(index),
        ),
      ),
    );
  }

  void _onRefresh() async {
    var res = await _fetchCategoriesAndAdProducts();
    if (res.item1 && mounted) {
      setState(() {
        _categories = res.item2;
        _products = res.item3;
      });
    }
    _refreshController.refreshCompleted();
  }

  Future<Tuple3<bool, List<ProductCategory>, List<Product>>> _fetchCategoriesAndAdProducts() async {
    final Tuple2<bool, List<ProductCategory>> tp1 = await grpcFetchProductCategories();
    bool success = tp1.item1;
    List<ProductCategory> categories = tp1.item2;

    final Tuple2<bool, List<Product>> tp2 = await grpcFetchNextKProducts(
        k: 20,
        filterDetails: FilterDetails()
          ..publishedProductsOnly = true
          ..categoryId = -1
          ..businessPageId = -1);
    success &= tp2.item1;
    List<Product> products = tp2.item2;

    return Tuple3(success, categories, products);
  }

  Widget _getListViewItem(int index) {
    int categoryRows = _categories == null ? 1 : (_categories.length / 2).ceil();
    // int productRows = _products == null ? 1 : (_products.length / 2).ceil();
    Size screenSize = MediaQuery.of(context).size;

    if (index >= 3 + categoryRows + 1) {
      // products section
      index -= 3 + categoryRows + 1;
      if (_products == null)
        return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
      else if (_products.length > 0)
        return _buildProductRow(context, index, screenSize);
      else
        return Container(); // empty products
    } else if (index == 3 + categoryRows) {
      // mid splitter part
      return getSectionSplitter(Locale.get("Top hit products"));
    } else if (index >= 3) {
      // categories section
      index -= 3;
      if (_categories == null)
        return SpinKitFoldingCube(color: Colors.blue, size: 50.0);
      else if (_categories.length > 0)
        return _buildCategoryRow(context, index, screenSize);
      else
        return Container(); // empty categoriesa
    } else if (index == 2) {
      // top splitter part
      return getSectionSplitter(Locale.get("Product categories"));
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

  InkWell _buildCategoryItem(ProductCategory category, Size screenSize) {
    return InkWell(
      onTap: () => _onCategoryTap(category),
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
                Container(width: 40, height: 40, child: Image.memory(category.pictureBlob))
              ],
            ),
          )),
    );
  }

  Row _buildCategoryRow(BuildContext context, int index, Size screenSize) {
    int categoryIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildCategoryItem(_categories[categoryIndex], screenSize)]);
    if (categoryIndex < _categories.length - 1) // two elements in one row
      row.children.add(_buildCategoryItem(_categories[categoryIndex + 1], screenSize));

    return row;
  }

  InkWell _buildProductItem(BuildContext context, Product product, Size screenSize) {
    double iconWH = screenSize.width * 0.45;

    return InkWell(
        onTap: () => _onProductTap(product),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            elevation: 1.0,
            child: Container(
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
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.memory(
                            product.pictureBlob,
                            fit: BoxFit.cover,
                            height: iconWH,
                          ))),
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
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          color: Colors.white,
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                rating: product.stars,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 15.0,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ),
                              Text("(${product.reviewsCount})"),
                            ],
                          ),
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

  void _onProfileWidgetTap(BuildContext context) {
    widget.rootTabsScreenState.switchTab(RootTabsScreenState.MENU_TAB);
  }

  void _onCategoryTap(ProductCategory category) async {
    await Navigator.of(context).pushNamed(CategoryProductsScreen.route_name, arguments: category);
  }

  void _onProductTap(Product product) async {
    await Navigator.of(context).pushNamed(ProductViewerScreen.route_name, arguments: product);
  }
}
