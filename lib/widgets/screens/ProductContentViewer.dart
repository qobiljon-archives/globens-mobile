import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/DriveHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProductContentViewer extends StatefulWidget {
  static const String route_name = '/product_content_viewer';

  @override
  ProductContentViewerState createState() => ProductContentViewerState();
}

class ProductContentViewerState extends State<ProductContentViewer> {
  Content _content;
  VideoPlayerController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      _content = ModalRoute.of(context).settings.arguments as Content;
    });

    getApplicationDocumentsDirectory().then((dir) async {
      var file = new File("${dir.path}/${_content.title}");

      if (!await file.exists()) {
        file = await file.create();
        await DriveHelper.downloadFile(_content.fileId, file.path, () {
          _controller = VideoPlayerController.file(file)
            ..initialize().then((_) {
              setState(() {});
            });
        });
      } else {
        _controller = VideoPlayerController.file(file)
          ..initialize().then((_) {
            setState(() {});
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(_content == null ? "" : _content.title, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: _controller == null
          ? Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(children: <Widget>[SpinKitWave(color: Colors.blue, size: 50.0), Text('Loading the file')]),
            )
          : Center(child: _controller.value.isInitialized ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)) : Container()),
      floatingActionButton: _controller != null && _controller.value.isInitialized
          ? FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow))
          : null,
    );
  }
}
