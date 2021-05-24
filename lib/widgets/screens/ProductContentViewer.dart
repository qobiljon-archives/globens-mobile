import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/utils/DriveHelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';

class ProductContentViewer extends StatefulWidget {
  static const String route_name = '/product_content_viewer';

  @override
  ProductContentViewerState createState() => ProductContentViewerState();
}

class ProductContentViewerState extends State<ProductContentViewer> {
  Content _content;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  final bool looping = true;
  final bool autoplay = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _content = ModalRoute.of(context).settings.arguments as Content;
    getApplicationDocumentsDirectory().then((dir) async {
      var file = new File("${dir.path}/${_content.title}");

      if (!await file.exists()) {
        file = await file.create();
        await DriveHelper.downloadFile(_content.fileId, file.path, () async {
          _videoPlayerController = VideoPlayerController.file(file);
          await _videoPlayerController.initialize();
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            aspectRatio: _videoPlayerController.value.aspectRatio,
            autoInitialize: true,
            autoPlay: true,
            looping: true,
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
          setState(() {});
        });
      } else {
        _videoPlayerController = VideoPlayerController.file(file);
        await _videoPlayerController.initialize();
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: _videoPlayerController.value.aspectRatio,
          autoInitialize: false,
          autoPlay: true,
          looping: true,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        );
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(_content == null ? "" : _content.title, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: _videoPlayerController == null || !_videoPlayerController.value.isInitialized ? Center(child: SpinKitSquareCircle(color: Colors.blue, size: 50.0)) : Padding(padding: const EdgeInsets.all(8.0), child: Chewie(controller: _chewieController)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
