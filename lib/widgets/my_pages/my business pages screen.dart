import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import '../commons/business page viewer modal view.dart';
import 'package:flutter/material.dart';

class MyBusinessPagesScreen extends StatefulWidget {
  @override
  _MyBusinessPagesScreenState createState() => _MyBusinessPagesScreenState();
}

class _MyBusinessPagesScreenState extends State<MyBusinessPagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _body = [];
  List<Widget> _footer = [];

  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part of header and footer
    _header = [getTitleWidget("My pages", textColor: Colors.black)];
    _footer = [
      RaisedButton(
        onPressed: () => _onCreateProductPressed(context),
        child: Text("Create"),
      )
    ];

    // 2. dynamic part : change body (i.e., business pages) from server
    grpcFetchMyBusinessPages(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<BusinessPage> businessPages = tuple.item2;
      if (success)
        setState(() {
          _body = businessPages;
        });
      else {
        AppUser.signOut();
        Navigator.pushNamed(context, "root");
      }
    });
  }

  @override
  Widget build(context) {
    return Container(
      child: ListView.builder(
        itemCount: _header.length + _body.length + _footer.length,
        itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
      ),
    );
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _body.length) {
      // footer section
      index -= _header.length + _body.length;
      return _footer[index];
    } else if (index >= _header.length) {
      // business pages section
      index -= _header.length;
      return buildBusinessPageItem(context, index);
    } else {
      // header section
      return _header[index];
    }
  }

  Widget buildBusinessPageItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _openIndividualBusinessPage(context, _body[index]);
          },
          onLongPress: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
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
                if (index == 0)
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "${_body[index].title}",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "${_body[index].title}",
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 20.0),
                      )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (context) => BusinessPageEditorModalView());
    grpcFetchMyBusinessPages(AppUser.sessionKey).then((tuple) {
      bool success = tuple.item1;
      List<BusinessPage> businessPages = tuple.item2;
      if (success)
        setState(() {
          _body = businessPages;
        });
      else {
        AppUser.signOut();
        Navigator.pushNamed(context, "root");
      }
    });
  }

  void _openIndividualBusinessPage(BuildContext context, BusinessPage businessPage) async {
    await Navigator.pushNamed(context, '/business_page_details', arguments: businessPage);
  }
}
