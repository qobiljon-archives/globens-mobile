import 'package:globens_flutter_client/widgets/modal_views/business%20page%20viewer%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
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
    _updateDynamicPart();
  }

  @override
  Widget build(context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: index == 0 ? Colors.deepOrange : Colors.blueAccent,
        ),
        itemCount: _header.length + _body.length + _footer.length,
        itemBuilder: (BuildContext context, int index) =>
            _getListViewItem(context, index),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _body.length) {
      // footer section
      index -= _header.length + _body.length;
      return _footer[index];
    } else if (index >= _header.length) {
      // business pages section
      index -= _header.length;
      return _buildBusinessPageItem(context, index);
    } else {
      // header section
      return _header[index];
    }
  }

  Widget _buildBusinessPageItem(BuildContext context, int index) {
    return Container(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      child: GestureDetector(
        onTap: () {
          _openIndividualBusinessPage(context, _body[index]);
        },
        onLongPress: () {},
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: MemoryImage(_body[index].pictureBlob),
                ),
              ),
              if (index == 0)
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "${_body[index].title}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${_body[index].title}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )),
            ],
          ),
        ),
      ),
    );
  }

  void _updateDynamicPart() {
    grpcFetchMyBusinessPages(AppUser.sessionKey).then((tuple) async {
      bool success = tuple.item1;
      List<BusinessPage> businessPages = tuple.item2;
      if (success)
        setState(() {
          _body = businessPages;
        });
      else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(Duration(seconds: 3), onTimeout: () {
      print("Timeout");
    });
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(
        context: context, builder: (context) => BusinessPageViewerModalView());
    grpcFetchMyBusinessPages(AppUser.sessionKey).then((tuple) async {
      bool success = tuple.item1;
      List<BusinessPage> businessPages = tuple.item2;
      if (success)
        setState(() {
          _body = businessPages;
        });
      else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(Duration(seconds: 3), onTimeout: () {
      print("timeout");
      //TODO:  cancel  future call
    });
  }

  void _openIndividualBusinessPage(
      BuildContext context, BusinessPage businessPage) async {
    await Navigator.of(context)
        .pushNamed('/business_page_details', arguments: businessPage);
  }
}
