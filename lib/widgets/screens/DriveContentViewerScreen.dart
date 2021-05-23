import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Product.dart';

class DriveContentViewer extends StatefulWidget {
  final Content _content;

  DriveContentViewer(this._content);

  @override
  DriveContentViewerState createState() => DriveContentViewerState();
}

class DriveContentViewerState extends State<DriveContentViewer> {
  InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget._content.title)),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
              child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(widget._content.url)),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  }))
        ])),
      ),
    );
  }
}
