import 'package:globens_flutter_client/widgets/commons/product%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/widgets/commons/job%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

class BusinessPageDetailsScreen extends StatefulWidget {
  BusinessPageDetailsScreen();

  @override
  _BusinessPageDetailsScreenState createState() => _BusinessPageDetailsScreenState();
}

class _BusinessPageDetailsScreenState extends State<BusinessPageDetailsScreen> {
  List<Widget> _header = [];
  List<Product> _products = [];
  List<User> _employees = []; // todo come back
  List<Job> _vacantJobs = [];
  List<Widget> _footer = [];
  BusinessPage _businessPage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 0. parsing arguments passed to this route (business page)
    _businessPage = ModalRoute.of(context).settings.arguments as BusinessPage;

    // 1. static part : set up common part of header and footer
    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          Text(
            "${_businessPage.title}",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ];
    _footer = [
      Container(
        width: double.maxFinite,
        child: RaisedButton(
          onPressed: () => _onCreateProductPressed(context),
          child: Text("Create your product"),
        ),
      ),
    ];

    // 2. dynamic part : change footer according to user's role in business page
    if (_businessPage.role == VacancyRole.BUSINESS_OWNER)
      _footer.add(Container(
        width: double.maxFinite,
        child: RaisedButton(
          onPressed: () => _onCreateVacancyPressed(context),
          child: Text("Create a new vacancy"),
        ),
      ));

    // 3. dynamic part : change body (i.e., products, vacancies, employees) according to user's role in business page
    grpcFetchBusinessPageProducts(AppUser.sessionKey, _businessPage.id).then((tuple) async {
      bool success = tuple.item1;
      List<Product> products = tuple.item2;
      if (success)
        setState(() {
          _products = products;
        });
      else {
        await AppUser.signOut();
        await Navigator.pushReplacementNamed(context, '/');
      }
    });
    grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage.id).then((tuple) async {
      bool success = tuple.item1;
      List<Job> jobs = tuple.item2;
      if (success)
        setState(() {
          _vacantJobs = jobs;
        });
      else {
        await AppUser.signOut();
        await Navigator.pushReplacementNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _header.length + _products.length + _vacantJobs.length + _footer.length,
          itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _products.length + _vacantJobs.length) {
      // footer section
      index -= _header.length + _products.length + _vacantJobs.length;
      return _footer[index];
    } else if (index >= _header.length + _products.length) {
      // vacancies section
      index -= _header.length + _products.length;
      return buildJobItem(context, index);
    } else if (index >= _header.length) {
      // products section
      index -= _header.length;
      return buildProductItem(context, index);
    } else {
      // header section
      return _header[index];
    }
  }

  Widget buildProductItem(BuildContext context, int index) {
    Row productRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onProductPressed(context),
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: MemoryImage(_products[index].pictureBlob),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${_products[index].name}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 20.0),
                    )),
              ],
            ),
          ),
        ),
      ],
    );

    if (index == 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getTitleWidget("Products", textColor: Colors.black), productRow],
      );
    else
      return productRow;
  }

  Widget buildJobItem(BuildContext context, int index) {
    String position = "(full position)";
    if (_vacantJobs[index].isVacant) position = "(empty position)";

    Row jobRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onVacancyPressed(context, _vacantJobs[index], _businessPage),
          child: Row(
            children: [
              Text(
                "${_vacantJobs[index].title}",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                " $position",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ],
    );

    if (index == 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getTitleWidget("Jobs", textColor: Colors.black), jobRow],
      );
    else
      return jobRow;
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (_context) => ProductEditorModalView(_businessPage));

    Tuple2<bool, List<Product>> res = await grpcFetchBusinessPageProducts(AppUser.sessionKey, _businessPage.id);
    bool success = res.item1;
    List<Product> products = res.item2;
    if (success)
      setState(() {
        _products = products;
      });
    else {
      await AppUser.signOut();
      await Navigator.pushReplacementNamed(context, '/');
    }
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onCreateVacancyPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (_context) => JobPageEditorModalView.getModalView(context, _businessPage));
    Tuple2<bool, List<Job>> res = await grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage.id);

    bool success = res.item1;
    List<Job> vacancies = res.item2;
    if (success) {
      setState(() {
        _vacantJobs = vacancies;
      });
    } else {
      await AppUser.signOut();
      await Navigator.pushReplacementNamed(context, '/');
    }
  }

  void _onProductPressed(BuildContext context) {
    // todo open product details modal view
  }

  void _onVacancyPressed(BuildContext context, Job vacantJob, BusinessPage businessPage) async {
    await Navigator.pushNamed(context, '/business_page_details/job_applications_list', arguments: {'job': vacantJob, 'businessPage': businessPage});
  }
}
