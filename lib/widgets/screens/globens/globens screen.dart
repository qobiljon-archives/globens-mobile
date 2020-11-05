import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class GlobensScreen extends StatefulWidget {
  @override
  GlobensScreenState createState() => GlobensScreenState();
}

class GlobensScreenState extends State<GlobensScreen> {
  List<Widget> _header = [];
  List<dynamic> _body = [];
  List<Widget> _footer = [];

  @override
  void initState() {
    super.initState();

    _header = [getTitleWidget("Globens")];
    _footer = [Container(
      child: Column(
          children: [
            Container(
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: () => _onLookingForAJobButtonPressed(context),
                child: Text("Looking for a job?"),
              ),
            ),
            Container(
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: () => _onExploreProductsPressed(context),
                child: Text("Explore our products"),
              ),
            ),
          ],
        ),
      )];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _header.length + _body.length + _footer.length,
        itemBuilder: (BuildContext context, int index) =>
            _getListViewItem(context, index),
      ),
    );
  }

  Widget _buildBodySectionItem(int index) {
    return null;
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _body.length)
      return _footer[index - _footer.length - _body.length];
    else
      return _buildBodySectionItem(index - _header.length);
  }

  void _onLookingForAJobButtonPressed(BuildContext context) async {
    if (AppUser.isAuthenticated())
      await Navigator.of(context).pushNamed('/vacant_jobs');
    else {
      await toast("Please SignIn First");
    }
  }

  void _onExploreProductsPressed(BuildContext context) async {
    if (AppUser.isAuthenticated()) {
      InAppPurchaseConnection.enablePendingPurchases();
      await Navigator.of(context).pushNamed('/products_list');
    } else {
      await toast("Please SignIn First");
    }
  }
}
