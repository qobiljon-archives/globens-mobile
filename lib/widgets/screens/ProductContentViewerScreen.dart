import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:globens_flutter_client/widgets/screens/DriveContentViewer.dart';
import 'package:video_player/video_player.dart';
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
        body: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: _contents.length,
            itemBuilder: (context, i) {
              return _buildRow(_contents[i]);
            }));
  }

  Widget _buildRow(Content content) {
    return ListTile(
      title: TextButton(
        child: Text(content.title),
      ),
      onTap: () => _onContentPressed(content),
    );
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
