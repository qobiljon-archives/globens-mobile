import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/modal_views/BusinessPageViewerModalView.dart';
import 'package:tuple/tuple.dart';

class MyBusinessPagesScreen extends StatefulWidget {
  @override
  _MyBusinessPagesScreenState createState() => _MyBusinessPagesScreenState();
}

class _MyBusinessPagesScreenState extends State<MyBusinessPagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _businessPages = [];
  List<Widget> _footer = [];
  bool timeout = false;

  @override
  void initState() {
    super.initState();

    // 1. static part : set up common part of header and footer
    _header = [getTitleWidget("My business pages", textColor: Colors.black)];
    _footer = [
      Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton.icon(
          onPressed: () => _onCreateProductPressed(context),
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: Icon(
            Icons.corporate_fare_outlined,
            color: Colors.white,
          ),
          label: Text(
            "BUILD A NEW BUSINESS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];

    // 2. dynamic part : change body (i.e., business pages) from server
    _fetchMyBusinessPages();
  }

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: _header.length + _businessPages.length + _footer.length,
      itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
    );
  }

  Widget _buildBusinessPageItem(BuildContext context, BusinessPage businessPage) {
    return InkWell(
        onTap: () => _openIndividualBusinessPage(context, businessPage),
        child: Card(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: MemoryImage(businessPage.pictureBlob),
                ),
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "${shorten(businessPage.title, 28, ellipsize: true)}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    "My role : ${businessPage.role}",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  )
                ]),
              )
            ],
          ),
        ));
  }

  Widget _getListViewItem(BuildContext context, int index) {
    if (index >= _header.length + _businessPages.length) {
      // footer section
      index -= _header.length + _businessPages.length;
      return _footer[index];
    } else if (index >= _header.length) {
      // business pages section
      index -= _header.length;
      return _buildBusinessPageItem(context, _businessPages[index]);
    } else {
      // header section
      return _header[index];
    }
  }

  Future<void> _fetchMyBusinessPages() async {
    Tuple2<bool, List<BusinessPage>> tp = await grpcFetchMyBusinessPages(AppUser.sessionKey);
    bool success = tp.item1;
    List<BusinessPage> businessPages = tp.item2;
    if (success) {
      setState(() {
        _businessPages = businessPages;
      });
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (context) => BusinessPageViewerModalView());
    grpcFetchMyBusinessPages(AppUser.sessionKey).then((tuple) async {
      bool success = tuple.item1;
      List<BusinessPage> businessPages = tuple.item2;
      if (success) {
        setState(() {
          _businessPages = businessPages;
        });
      } else {
        await AppUser.signOut();
        await Navigator.of(context).pushReplacementNamed('/');
      }
    }).timeout(Duration(seconds: 3), onTimeout: () {
      print("timeout");
    });
  }

  void _openIndividualBusinessPage(BuildContext context, BusinessPage businessPage) async {
    await Navigator.of(context).pushNamed('/business_page_details', arguments: businessPage);
  }
}
