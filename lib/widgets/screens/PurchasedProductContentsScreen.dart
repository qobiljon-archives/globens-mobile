import 'package:flutter/material.dart';
import 'dart:io';
import 'IndividualPurchasedProductContentViewerScreen.dart';

class PdfViewScreen extends StatefulWidget {
  final List _fileNames;
  Widget productView;

  PdfViewScreen(this._fileNames);

  @override
  _PdfViewScreenState createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView.builder(
            itemCount: widget._fileNames.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new RaisedButton(
                child: Text(widget._fileNames[index]),
                onPressed: () => {_onLessonPressed(widget._fileNames[index])},
              );
            }));
  }

  void _onLessonPressed(String fileName) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContentViewer(fileName),
        ));
  }
}
