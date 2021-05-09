import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'IndividualPurchasedProductContentViewerScreen.dart';
import 'package:flutter/material.dart';

class ViewProductContentScreen extends StatefulWidget {
  final Product _product;

  ViewProductContentScreen(this._product);

  @override
  _ViewProductContentScreenState createState() => _ViewProductContentScreenState();
}

class _ViewProductContentScreenState extends State<ViewProductContentScreen> {
  var _contents = Map<int, Content>();

  @override
  void initState() {
    super.initState();

    loadContents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new ListView(children: []));
  }

  Future<void> loadContents() async {
    _contents.clear();

    for (var contentId in widget._product.contents['ids']) {
      final res = await grpcFetchContentDetails(AppUser.sessionKey, contentId);
      if (res.item1) {
        _contents.putIfAbsent(contentId, () => res.item2);
      }
    }
    setState(() {});
  }

  void _onContentPressed(String fileName) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContentViewer(fileName),
        ));
  }
}
