import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/widgets/my%20pages%20screen.dart';
import 'package:globens_flutter_client/widgets/product%20editor%20modal%20view.dart';

//region businesspage detail screen
class BusinessPageDetail extends StatefulWidget {

  //region vars
  final title;
  final id;
  List<Widget> _header = [];
  List<Product> _body = [];
  List<Widget> _footer = [];
  BuildContext _context;
  //endregion

  BusinessPageDetail(this.title, this.id);

  @override
  _BusinessPageDetailState createState() => _BusinessPageDetailState();
}

class _BusinessPageDetailState extends State<BusinessPageDetail> {



  //region onPressed methods
  void _onCreateProductPressed() {
    showModalBottomSheet(context: widget._context, builder: (_context) => ProductPageEditorWidget(widget.id));
  }

  void _onCreateVacancyPressed() {}

  void onBackButtonPressed() {
    Navigator.pop(widget._context);
  }
  //endregion
  //region overrides
  @override
  void initState() {

    widget._header = [
      getTitleWidgetForProducts(
        widget.title,
        "Products",
        onBackButtonPressed,
      )
    ];
    widget._footer = [
      Column(
        children: [
          Container(
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () {
                _onCreateProductPressed();
              },
              child: Text("Create your product"),
            ),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () {
                _onCreateVacancyPressed();
              },
              child: Text("Create a new vacancy"),
            ),
          ),
        ],
      ),
    ];
    grpcFetchProducts(AppUser.sessionKey, widget.id).then((array) {
      setState(() {
        widget._body = array;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    widget._context = this.context;
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: widget._header.length + widget._body.length + widget._footer.length,
          itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
        ),
      ),
    );
  }
  //endregion
  // region utility methods
  Widget getListViewItem(BuildContext context, int index) {
    if (index < widget._header.length)
      return widget._header[index];
    else if (index >= widget._header.length + widget._body.length) return widget._footer[index - widget._footer.length - widget._body.length];

    //TODO: return products
  }

  Widget buildBusinessPageItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: MemoryImage(widget._body[index].imgUri),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${widget._body[index].name}",
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
  //endregion
}

//endregion
