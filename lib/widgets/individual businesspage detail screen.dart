import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/settings.dart';

class BusinessPageDetail extends StatefulWidget {
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

  @override
  void initState() {
    _header = [getTitleWidget("Products")];
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
    //TODO: fetch products
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
}

class ProductPageEditorWidget extends StatefulWidget {
  @override
  _BusinessPageEditorWidgetState createState() => _BusinessPageEditorWidgetState();
}

class _BusinessPageEditorWidgetState extends State<ProductPageEditorWidget> {
  TextEditingController _titleTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = this.context;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          getTitleWidget("Create a new Product", textColor: Colors.black),
          Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: _titleTextController,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter your title",
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextField(
                controller: _emailTextController,
                decoration: InputDecoration(
                  labelText: "Business email",
                  hintText: "Enter a business email",
                ),
              )),
          RaisedButton(
            onPressed: () {},
            child: Text("Create"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Spacer(),
          )
        ],
      ),
    );
  }
}
