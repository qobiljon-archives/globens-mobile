import 'IndividualPurchasedProductContentViewerScreen.dart';
import 'package:flutter/material.dart';

class ViewProductContentScreen extends StatefulWidget {
  final List _fileNames;

  ViewProductContentScreen(this._fileNames);

  @override
  _ViewProductContentScreenState createState() => _ViewProductContentScreenState();
}

class _ViewProductContentScreenState extends State<ViewProductContentScreen> {
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
