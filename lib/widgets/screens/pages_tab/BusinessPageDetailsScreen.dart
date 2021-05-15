import 'dart:math';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globens_flutter_client/widgets/screens/pages_tab/JobApplicationsListScreen.dart';
import 'package:globens_flutter_client/widgets/modal_views/VacancyCreatorModalView.dart';
import 'package:globens_flutter_client/widgets/screens/ProductCreatorScreen.dart';
import 'package:globens_flutter_client/generated_protos/gb_service.pb.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

class BusinessPageDetailsScreen extends StatefulWidget {
  static const String route_name = '/business_page_details';

  @override
  _BusinessPageDetailsScreenState createState() => _BusinessPageDetailsScreenState();
}

class _BusinessPageDetailsScreenState extends State<BusinessPageDetailsScreen> {
  Row _header;
  List<Product> _products = [];
  List<Job> _jobs = [];
  Container _createProductButton;
  Container _createVacancyButton;
  BusinessPage _businessPage;

  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part of header and footer
    _header = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: _onBackButtonPressed,
        ),
        getTitleWidget(Locale.get('Business page'), textColor: Colors.black, margin: EdgeInsets.all(0))
      ],
    );

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
    int productRows = max((_products.length / 2).ceil(), 1);

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      body: Container(
        child: ListView.builder(
          itemCount: 2 + productRows + 2 + _jobs.length + (_businessPage.role == Job.BUSINESS_OWNER_ROLE ? 1 : 0),
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    int productRows = max((_products.length / 2).ceil(), 1);
    int jobRows = max(_jobs.length, 1);
    Size screenSize = MediaQuery.of(context).size;

    if (index == 2 + productRows + 2 + jobRows) {
      // create new vacancy button
      return _createVacancyButton;
    } else if (index >= 2 + productRows + 2) {
      // vacancies section
      index -= 2 + productRows + 2;
      return _buildJobItem(context, _jobs[index]);
    } else if (index == 2 + productRows + 1) {
      // splitter
      return getSectionSplitter(Locale.get("Employees and vacancies"));
    } else if (index == 2 + productRows) {
      // create new product button
      return _createProductButton;
    } else if (index >= 2) {
      // products section
      index -= 2;
      if (_products.length == 0)
        return SpinKitFoldingCube(
          color: Colors.blue,
          size: 50.0,
        );
      else
        return _buildProductRow(context, index, screenSize);
    } else if (index == 1) {
      // splitter
      return getSectionSplitter(Locale.get("Products"));
    } else {
      // header section
      return _header;
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
        onTap: () => _onJobPressed(context, job, _businessPage),
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
        ));
  }

  Future<void> _fetchBusinessPageContent() async {
    final Tuple2<bool, List<Product>> tp1 = await grpcFetchNextKProducts(
        sessionKey: AppUser.sessionKey,
        filterDetails: FilterDetails()
          ..categoryId = -1
          ..businessPageId = _businessPage.id);
    bool success = tp1.item1;
    List<Product> products = tp1.item2;
    if (success) {
      setState(() {
        _products = products;
      });
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }

    final Tuple2<bool, List<Job>> tp2 = await grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage);
    success = tp2.item1;
    List<Job> jobs = tp2.item2;
    if (success) {
      setState(() {
        _jobs = jobs;
      });
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
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

  void _onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  void _onCreateVacancyPressed() async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => VacancyCreatorModalView(businessPage: _businessPage));
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

  void _onJobPressed(BuildContext context, Job job, BusinessPage businessPage) async {
    await Navigator.of(context).pushNamed(JobApplicationsListScreen.route_name, arguments: {'job': job, 'businessPage': businessPage});
    await _fetchBusinessPageContent();
  }
}
