import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'available jobs screen.dart';

class GlobensScreen extends StatefulWidget {
  @override
  GlobensScreenState createState() => GlobensScreenState();
}

class GlobensScreenState extends State<GlobensScreen> {
  List<Widget> _header = [];
  List<dynamic> _body = [];
  List<Widget> _footer = [];

  BuildContext _context;

  @override
  void initState() {
    super.initState();

    _header = [getTitleWidget("Globens")];
    _footer = [
      Container(
        child: RaisedButton(
          onPressed: onLookingForAJobButtonPressed,
          child: Text("looking for a job?"),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
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

  void onLookingForAJobButtonPressed() {
    if (AppUser.isAuthenticated())
      Navigator.push(_context, MaterialPageRoute(builder: (context) => AvailableJobs()));
    else {
      toast("Please SignIn First");
    }
  }
}
