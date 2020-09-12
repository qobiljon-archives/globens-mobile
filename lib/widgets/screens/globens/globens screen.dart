import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

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
    _footer = [
      Container(
        child: RaisedButton(
          onPressed: () => _onLookingForAJobButtonPressed(context),
          child: Text("looking for a job?"),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _header.length + _body.length + _footer.length,
        itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
      ),
    );
  }

  Widget buildBodySectionItem(int index) {
    return null;
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _body.length)
      return _footer[index - _footer.length - _body.length];
    else
      return buildBodySectionItem(index - _header.length);
  }

  void _onLookingForAJobButtonPressed(BuildContext context) async {
    if (AppUser.isAuthenticated())
      await Navigator.of(context).pushNamed('/vacant_jobs');
    else {
      await toast("Please SignIn First");
    }
  }
}
