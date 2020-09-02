import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'individual businesspage detail screen.dart';
import 'business page editor modal view.dart';
import 'package:flutter/material.dart';

class MyPagesScreen extends StatefulWidget {
  @override
  _MyPagesScreenState createState() => _MyPagesScreenState();
}

class _MyPagesScreenState extends State<MyPagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _body = [];
  List<Widget> _footer = [];
  BuildContext _context;

  void openIndividualBusinessPage(String title, int businessPageId) {
    Navigator.push(_context,  MaterialPageRoute(builder: (_context)=>BusinessPageDetail(title,  businessPageId)));
  }

  @override
  void initState() {
    super.initState();

    _header = [getTitleWidget("My pages", textColor: Colors.black)];
    _footer = [
      RaisedButton(
        onPressed: () {
          _onCreateProductPressed();
        },
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
  Widget build(context) {
    this._context = context;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            openIndividualBusinessPage(_body[index].title, index);
          },
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

  void _onCreateProductPressed() {
    showModalBottomSheet(context: this._context, builder: (context) => BusinessPageEditorWidget());
  }
}

class ScreenArguments {
  final String title;
  final int businessPageId;


  String get page_title{
    return title;
  }

  int get page_id{
    return businessPageId;
  }
  ScreenArguments(this.title, this.businessPageId);
}
