import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class PagesScreen extends StatefulWidget {
  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _body = [];
  List<Widget> _footer = [];

  @override
  void initState() {
    super.initState();

    _header = [generateScreenTitle("My pages", textColor: Colors.black)];
    _footer = [
      RaisedButton(
        onPressed: _onCreateProductPressed,
        child: Text("Create"),
      )
    ];
    grpcFetchBusinessPages(AppUser.sessionKey).then((array) {
      setState(() {
        _body = array;
      });
    });
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

  Widget getListViewItem(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _body.length)
      return _footer[index - _footer.length - _body.length];
    else
      return buildBusinessPageItem(index - _header.length);
  }

  Widget buildBusinessPageItem(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: MemoryImage(_body[index].pictureBlob),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "${_body[index].title}",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  void _onCreateProductPressed() {}
}
