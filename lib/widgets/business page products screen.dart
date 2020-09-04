import 'package:globens_flutter_client/widgets/product%20editor%20modal%20view.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BusinessPageDetail extends StatefulWidget {
  final BusinessPage _businessPage;

  BusinessPageDetail(this._businessPage);

  @override
  _BusinessPageDetailState createState() => _BusinessPageDetailState();
}

class _BusinessPageDetailState extends State<BusinessPageDetail> {
  List<Widget> _header = [];
  List<Product> _body = [];
  List<Widget> _footer = [];

  @override
  void initState() {
    super.initState();

    _header = [
      Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => _onBackButtonPressed(context),
              ),
              Text(
                "${widget._businessPage.title}",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
          Container(
            // alignment: Alignment.topLeft,
            child: Text(
              "Products",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      )
    ];
    _footer = [
      Column(
        children: [
          Container(
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () => _onCreateProductPressed(context),
              child: Text("Create your product"),
            ),
          ),
          Container(
            width: double.maxFinite,
            child: RaisedButton(
              onPressed: () => _onCreateVacancyPressed(context),
              child: Text("Create a new vacancy"),
            ),
          ),
        ],
      ),
    ];
    grpcFetchProducts(AppUser.sessionKey, widget._businessPage.id).then((array) {
      setState(() {
        _body = array;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
    else if (index >= _header.length + _body.length)
      return _footer[index - _footer.length - _body.length];
    else
      return buildProductItem(context, index - _header.length);
  }

  Widget buildProductItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _onProductPressed(context),
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

  void _onCreateProductPressed(BuildContext context) async {
    await showModalBottomSheet(context: context, builder: (_context) => ProductPageEditorWidget(widget._businessPage));
    grpcFetchProducts(AppUser.sessionKey, widget._businessPage.id).then((array) {
      setState(() {
        _body = array;
      });
    });
  }

  void _onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void _onCreateVacancyPressed(BuildContext context) {
    // todo vacancy creation
  }

  void _onProductPressed(BuildContext context) {}
}
