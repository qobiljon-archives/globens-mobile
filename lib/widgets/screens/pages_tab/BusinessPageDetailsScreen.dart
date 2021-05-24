import 'package:globens_flutter_client/widgets/screens/pages_tab/JobApplicationsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/VacancyCreatorScreen.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';
import 'dart:math';

class BusinessPageDetailsScreen extends StatefulWidget {
  static const String route_name = '/business_page_details';

  @override
  _BusinessPageDetailsScreenState createState() => _BusinessPageDetailsScreenState();
}

class _BusinessPageDetailsScreenState extends State<BusinessPageDetailsScreen> {
  List<Product> _products;
  List<Job> _jobs;
  Container _createProductButton;
  Container _createVacancyButton;
  BusinessPage _businessPage;
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController(initialRefresh: true);

    _createProductButton = Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton.icon(
          onPressed: _onCreateProductPressed,
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: Icon(
            Icons.upload_file,
            color: Colors.white,
          ),
          label: Text(
            Locale.get("Create new product"),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
    _createVacancyButton = Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton.icon(
          onPressed: _onCreateVacancyPressed,
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: Icon(
            Icons.upload_file,
            color: Colors.white,
          ),
          label: Text(
            Locale.get("Create new vacancy"),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 0. parsing arguments passed to this route (business page)
    setState(() {
      _businessPage = ModalRoute.of(context).settings.arguments as BusinessPage;
    });

    // 3. dynamic part : change body (i.e., products, vacancies, employees) according to user's role in business page
    _fetchBusinessPageContent();
  }

  @override
  Widget build(BuildContext context) {
    int productRows = _products == null ? 1 : (_products.length / 2).ceil();
    int jobRows = _jobs == null ? 1 : _jobs.length;

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get('${Locale.REPLACE} (business page)', _businessPage.title), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: SmartRefresher(
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
          itemCount: 1 + productRows + 2 + jobRows + (_businessPage.role == Job.BUSINESS_OWNER_ROLE ? 1 : 0),
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      )
    );
  }

  void _onRefresh() async {
    var res = await _fetchBusinessPageContent();
    if (res.item1 && mounted) {
      setState(() {
        _products = res.item2;
        _jobs = res.item3;
      });
    }
    _refreshController.refreshCompleted();
  }

  Widget _getListViewItem(BuildContext context, int index) {
    int productRows = _products == null ? 1 : (_products.length / 2).ceil();
    int jobRows = _jobs == null ? 1 : max(_jobs.length, 1);
    Size screenSize = MediaQuery.of(context).size;

    if (index == 1 + productRows + 2 + jobRows) {
      // create new vacancy button
      return _createVacancyButton;
    } else if (index >= 1 + productRows + 2) {
      // vacancies section
      index -= 1 + productRows + 2;
      if (_jobs == null)
        return SpinKitFoldingCube(
          color: Colors.blue,
          size: 50.0,
        );
      else if (_jobs.length > 0)
        return _buildJobItem(context, _jobs[index]);
      else
        return Container(); // empty jobs
    } else if (index == 1 + productRows + 1) {
      // splitter
      return getSectionSplitter(Locale.get("Employees and vacancies"));
    } else if (index == 1 + productRows) {
      // create new product button
      return _createProductButton;
    } else if (index >= 1) {
      // products section
      index -= 1;
      if (_products == null)
        return SpinKitFoldingCube(
          color: Colors.blue,
          size: 50.0,
        );
      else if (_products.length > 0)
        return _buildProductRow(context, index, screenSize);
      else
        return Container(); // empty products
    } else {
      // splitter
      return getSectionSplitter(Locale.get("Products"));
    }
  }

  Row _buildProductRow(BuildContext context, int index, Size screenSize) {
    int productIndex = index * 2;

    Row row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_buildProductItem(context, _products[productIndex], screenSize)]);
    if (productIndex < _products.length - 1) // two elements in one row
      row.children.add(_buildProductItem(context, _products[productIndex + 1], screenSize));

    return row;
  }

  InkWell _buildProductItem(BuildContext context, Product product, Size screenSize) {
    double iconWH = screenSize.width * 0.45;
    final textColor = product.published ? Colors.black : Colors.grey;
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
                        ),
                      ),
                      Text(
                        Locale.get("by ${Locale.REPLACE}", product.businessPage.title),
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
          )),
    );
  }

  Widget _buildJobItem(BuildContext context, Job job) {
    return InkWell(
      onTap: () => job.isVacant && _businessPage.role == Job.BUSINESS_OWNER_ROLE ? _onVacancyClickPressed(context, job, _businessPage) : null,
      child: Card(
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: job.isVacant ? AssetImage("assets/placeholder_vacancy.png") : NetworkImage(job.hiredUser.picture),
              ),
            ),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  shorten(job.title, 28, ellipsize: true),
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  job.isVacant ? "[ vacant position ]" : "${job.hiredUser.name} (${job.hiredUser.email})",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<Tuple3<bool, List<Product>, List<Job>>> _fetchBusinessPageContent() async {
    var tp1 = await grpcFetchNextKProducts(
        sessionKey: AppUser.sessionKey,
        filterDetails: FilterDetails()
          ..categoryId = -1
          ..businessPageId = _businessPage.id);
    bool success = tp1.item1;
    List<Product> products = tp1.item2;

    var tp2 = await grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage);
    success &= tp2.item1;
    List<Job> jobs = tp2.item2;

    return Tuple3(success, products, jobs);
  }

  void _onCreateProductPressed() async {
    await Navigator.of(context).pushNamed(ProductCreatorScreen.route_name, arguments: _businessPage);

    Tuple2<bool, List<Product>> res = await grpcFetchNextKProducts(
        filterDetails: FilterDetails()
          ..categoryId = -1
          ..businessPageId = _businessPage.id);
    bool success = res.item1;
    List<Product> products = res.item2;
    if (success) {
      if (this.mounted)
        setState(() {
          _products = products;
        });
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onCreateVacancyPressed() async {
    await Navigator.of(context).pushNamed(VacancyCreatorScreen.route_name, arguments: _businessPage);
    Tuple2<bool, List<Job>> res = await grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage);

    bool success = res.item1;
    List<Job> vacancies = res.item2;
    if (success) {
      if (this.mounted)
        setState(() {
          _jobs = vacancies;
        });
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onProductTap(BuildContext context, Product product) async {
    await Navigator.of(context).pushNamed(ProductCreatorScreen.route_name, arguments: product);
    await _fetchBusinessPageContent();
  }

  void _onVacancyClickPressed(BuildContext context, Job job, BusinessPage businessPage) async {
    await Navigator.of(context).pushNamed(JobApplicationsListScreen.route_name, arguments: {'job': job, 'businessPage': businessPage});
    await _fetchBusinessPageContent();
  }
}
