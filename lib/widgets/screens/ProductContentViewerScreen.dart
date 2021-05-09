import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:globens_flutter_client/widgets/screens/DriveContentViewer.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProductContentViewerScreen extends StatefulWidget {
  final Product _product;

  ProductContentViewerScreen(this._product);

  @override
  _ProductContentViewerScreenState createState() => _ProductContentViewerScreenState();
}

class _ProductContentViewerScreenState extends State<ProductContentViewerScreen> {
  var _contents = <Content>[];

  @override
  void initState() {
    super.initState();
    loadContents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Locale.get("Product content")),
        ),
        body: Scaffold(
            backgroundColor: Color.fromRGBO(240, 242, 245, 1),
            body: Container(
              child: ListView(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0 + MediaQuery.of(context).viewInsets.bottom),
                shrinkWrap: true,
                children: [
                  for (var content in _contents) _buildContentWidget(content),
                ],
              ),
        )));
  }

  Widget _buildContentWidget(Content content) {
    return GestureDetector(
        onTap: () => _onContentPressed(content),
        child: Card(
            margin: EdgeInsets.only(top: 10.0),
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(getFileTypeIconForFilename(content.title), color: Colors.black87, size: 30.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        content.title,
                        maxLines: 10,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ))));
  }

  Future<void> loadContents() async {
    _contents.clear();

    for (var contentId in widget._product.contents['ids']) {
      final res = await grpcFetchContentDetails(AppUser.sessionKey, contentId);
      if (res.item1) {
        _contents.add(res.item2);
      }
    }
    setState(() {});
  }

  void _onContentPressed(Content content) async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductContentViewerScreen(fileName)));
    Navigator.push(context, MaterialPageRoute(builder: (context) => DriveContentViewer(content)));
  }
}
