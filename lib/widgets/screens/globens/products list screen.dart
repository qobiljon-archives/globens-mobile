import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20application%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/widgets/modal_views/job%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';


class ProductsListScreen extends StatefulWidget {
  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  List<Job> _products = [];
  List<Widget> _header = [];

  @override
  void initState() {
    super.initState();

    _header = [
      Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _onBackButtonPressed(context),
          ),
          getTitleWidget("Products"),
        ],
      ),
    ];
    _updateDynamicPart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _header.length + _products.length,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index == 0)
      return _header[index];
    else {
      index -= _header.length;
      return _buildProductItem(context, index);
    }
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            child: Text(
              "${_products[index].title}",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () => _openProductDetails(context, index)),
        RaisedButton(
          onPressed: () => _onPurchase(context, index),
          child: Text("Purchase"),
        ),
      ],
    );
  }

  void _updateDynamicPart() async {
    //TODO:  fetch list of products
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onPurchase(BuildContext context, int index) async {
     //TODO: implement purchase functionality
  }

  void _openProductDetails(BuildContext context, index) async {
    await showModalBottomSheet(context: context, builder: (context) => JobViewerModalView(job: _products[index]));
    grpcFetchBusinessPageVacancies(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<Job> jobs = tuple.item2;
      if (success) {
        setState(() {
          _products = jobs;
        });
      } else
        AppUser.signOut().then((value) => Navigator.of(context).pushReplacementNamed('/'));
    });
  }
}
