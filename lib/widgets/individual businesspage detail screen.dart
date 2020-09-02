import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:globens_flutter_client/widgets/my%20pages%20screen.dart';
import 'package:globens_flutter_client/widgets/product%20editor%20modal%20view.dart';

class BusinessPageDetail extends StatefulWidget {
  final title;
  final id;


  BusinessPageDetail(this.title, this.id);

  @override
  _BusinessPageDetailState createState() => _BusinessPageDetailState();
}

class _BusinessPageDetailState extends State<BusinessPageDetail> {
  List<Widget> _header = [];
  List<Product> _body = [];
  List<Widget> _footer = [];
  BuildContext _context;

  void _onCreateProductPressed() {
    showModalBottomSheet(context: _context, builder: (_context) => ProductPageEditorWidget());
  }

  void _onCreateVacancyPressed() {}

  void onBackButtonPressed() {
    Navigator.pop(_context);
  }

  @override
  void initState() {

    _header = [
      getTitleWidgetForProducts(
        widget.title,
        "Products",
        onBackButtonPressed,
      )
    ];
    _footer = [
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
        _body = array;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = this.context;


    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _header.length + _body.length + _footer.length,
          itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
        ),
      ),
    );
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _body.length) return _footer[index - _footer.length - _body.length];

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
                    backgroundImage: MemoryImage(_body[index].imgUri),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "${_body[index].name}",
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
}
