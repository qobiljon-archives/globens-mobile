import 'package:globens_flutter_client/widgets/modal_views/product%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

class BusinessPageDetailsScreen extends StatefulWidget {
  @override
  _BusinessPageDetailsScreenState createState() =>
      _BusinessPageDetailsScreenState();
}

class _BusinessPageDetailsScreenState extends State<BusinessPageDetailsScreen> {
  List<Widget> _header = [];
  List<Product> _products = [];
  List<Job> _jobs = [];
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
          backButton(_onBackButtonPressed, context),
          Expanded(child: getTitleWidget(_businessPage.title)),
        ],
      ),
    ];
    _footer = [
      Container(
        width: double.maxFinite,
        child: RaisedButton(onPressed: () => _onCreateProductPressed(context), child: Text("Create your product"),),),
    ];

    // 2. dynamic part : change footer according to user's role in business page
    if (_businessPage.role == VacancyRole.BUSINESS_OWNER)
      _footer.add(Container(width: double.maxFinite, child: RaisedButton(onPressed: () => _onCreateVacancyPressed(context), child: Text("Create a new vacancy"),),));

    // 3. dynamic part : change body (i.e., products, vacancies, employees) according to user's role in business page
    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount:
              _header.length + _products.length + _jobs.length + _footer.length,
          itemBuilder: (BuildContext context, int index) =>
              _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _products.length + _jobs.length) {
      // footer section
      index -= _header.length + _products.length + _jobs.length;
      return _footer[index];
    } else if (index >= _header.length + _products.length) {
      // vacancies section
      index -= _header.length + _products.length;
      return _buildJobItem(context, index);
    } else if (index >= _header.length) {
      // products section
      index -= _header.length;
      return _buildProductItem(context, index);
    } else {
      // header section
      return _header[index];
    }
  }

  Widget _buildProductItem(BuildContext context, int index) {
    Row productRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onProductPressed(context, _products[index]),
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
        children: [
          getTitleWidget("Products", textColor: Colors.black),
          productRow
        ],
      );
    else
      return productRow;
  }

  Widget _buildJobItem(BuildContext context, int index) {
    Row jobRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _onJobPressed(context, _jobs[index], _businessPage),
            child: Text(
              "${_jobs[index].title}",
              style: TextStyle(
                  fontSize: 20.0,
                  color: _jobs[index].isVacant ? Colors.grey : Colors.black,
                  fontStyle: _jobs[index].isVacant
                      ? FontStyle.italic
                      : FontStyle.normal),
            ),
          ),
        ),
      ],
    );

    if (index == 0)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getTitleWidget("Jobs / positions", textColor: Colors.black),
          jobRow
        ],
      );
    else
      return jobRow;
  }

  void _updateDynamicPart() {
    grpcFetchBusinessPageProducts(AppUser.sessionKey, _businessPage.id)
        .then((tuple) async {
      bool success = tuple.item1;
      List<Product> products = tuple.item2;
      if (success) {
        if (this.mounted)
          setState(() {
            _products = products;
          });
      } else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(Duration(seconds: 3), onTimeout: () {
      print("Timeout");
    });
    grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage.id)
        .then((tuple) async {
      bool success = tuple.item1;
      List<Job> jobs = tuple.item2;
      if (success) {
        if (this.mounted)
          setState(() {
            _jobs = jobs;
          });
      } else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(Duration(seconds: 3), onTimeout: () {
      print("TimeOut");
      //TODO: Stop  future call automatically
    });
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => ProductEditorModalView(_businessPage, null));

    Tuple2<bool, List<Product>> res = await grpcFetchBusinessPageProducts(
        AppUser.sessionKey, _businessPage.id);
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

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onCreateVacancyPressed(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => JobViewerModalView(businessPage: _businessPage));
    Tuple2<bool, List<Job>> res =
        await grpcFetchBusinessPageJobs(AppUser.sessionKey, _businessPage.id);

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

  void _onProductPressed(BuildContext context, Product product) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => ProductEditorModalView(_businessPage, product));
  }

  void _onJobPressed(
      BuildContext context, Job job, BusinessPage businessPage) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) =>
            JobViewerModalView(job: job, businessPage: _businessPage));
    _updateDynamicPart();
  }
}
