import 'package:globens_flutter_client/widgets/screens/BusinessPageCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages_tab/BusinessPageDetailsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class MyBusinessPagesScreen extends StatefulWidget {
  final RootTabsScreenState rootTabsScreenState;

  MyBusinessPagesScreen(this.rootTabsScreenState);

  @override
  _MyBusinessPagesScreenState createState() => _MyBusinessPagesScreenState();
}

class _MyBusinessPagesScreenState extends State<MyBusinessPagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _businessPages;
  List<Widget> _footer = [];
  RefreshController _refreshController;

  @override
  void initState() {
    super.initState();

    _refreshController = RefreshController(initialRefresh: true);

    // 1. static part : set up common part of header and footer
    _header = [getTitleWidget(Locale.get("My business pages"), textColor: Colors.black)];
    _footer = [
      Container(
        margin: EdgeInsets.all(20),
        child: RaisedButton.icon(
          onPressed: () => _onCreateBusinessPagePressed(context),
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          icon: Icon(
            Icons.corporate_fare_outlined,
            color: Colors.white,
          ),
          label: Text(
            Locale.get("Build a new business"),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(context) {
    int pagesRows = _businessPages == null ? 1 : _businessPages.length;

    return SafeArea(
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(color: Colors.blue,),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle)
              body = Text("Pull up to load more");
            else if (mode == LoadStatus.loading)
              body = Text("Loading");
            else if (mode == LoadStatus.failed)
              body = Text("Load Failed! Click retry!");
            else if (mode == LoadStatus.canLoading)
              body = Text("release to load more");
            else
              body = Text("No more Data");
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _header.length + pagesRows + _footer.length,
          itemBuilder: (BuildContext context, int index) => _getListViewItem(context, index),
        ),
      ),
    );
  }

  void _onRefresh() async {
    var res = await grpcFetchMyBusinessPages(AppUser.sessionKey);
    if (res.item1 && mounted) {
      setState(() {
        _businessPages = res.item2;
      });
    }
    _refreshController.refreshCompleted();
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
                    Locale.get("My role: ${Locale.REPLACE}", businessPage.role),
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  )
                ]),
              )
            ],
          ),
        ));
  }

  Widget _getListViewItem(BuildContext context, int index) {
    int pagesRows = _businessPages == null ? 1 : _businessPages.length;

    if (index >= _header.length + pagesRows) {
      // footer section
      index -= _header.length + pagesRows;
      return _footer[index];
    } else if (index >= _header.length) {
      // business pages section
      index -= _header.length;
      if (_businessPages == null)
        return SpinKitFoldingCube(
          color: Colors.blue,
          size: 50.0,
        );
      else if (_businessPages.length > 0)
        return _buildBusinessPageItem(context, _businessPages[index]);
      else
        return Container(); // empty business pages
    } else {
      // header section
      return _header[index];
    }
  }

  void _onCreateBusinessPagePressed(BuildContext context) async {
    await Navigator.of(context).pushNamed(BusinessPageCreatorScreen.route_name);
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
    await Navigator.of(context).pushNamed(BusinessPageDetailsScreen.route_name, arguments: businessPage);
  }
}
