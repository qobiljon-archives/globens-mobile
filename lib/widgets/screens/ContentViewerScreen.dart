import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/DriveHelper.dart';
import 'package:globens_flutter_client/entities/Content.dart';
import 'package:flutter_filereader/flutter_filereader.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';

class ContentViewerScreen extends StatefulWidget {
  static const String route_name = '/product_content_viewer';

  @override
  ContentViewerScreenState createState() => ContentViewerScreenState();
}

class ContentViewerScreenState extends State<ContentViewerScreen> {
  Content _content;
  ContentType _contentType;

  // content==media (i.e., mp3, mp4)
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  // content==document (i.e., doc, xls, ppt, pdf, txt)
  File _documentFile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    () async {
      if (AppUser.googleDriveEmail == null) {
        try {
          if (AppUser.isAuthenticated()) {
            // apple sign in without google drive access
            toast("Globens works with Google Drive. To view a product, you would need to give access to your Google account (email address).");
            if (!await AppUser.googleDriveAuth()) Navigator.of(context).pop();
          } else {
            toast("Please sign in to view the content!");
            Navigator.of(context).pop();
          }
        } catch (e) {
          Navigator.of(context).pop();
        }
      }

      _content = ModalRoute.of(context).settings.arguments as Content;
      _contentType = getContentType(_content.title);

      var docsDir = await getApplicationDocumentsDirectory();
      var cacheDir = Directory("${docsDir.path}/globens_cache");
      var file = new File("${cacheDir.path}/${_content.title}");
      var canViewContent = await file.exists();
      if (!canViewContent) {
        file = await file.create();
        canViewContent = await DriveHelper.downloadFile(_content.fileId, file.path);
      }
      if (canViewContent) {
        if (_contentType == ContentType.MEDIA) {
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
        } else if (_contentType == ContentType.DOCUMENT) {
          setState(() => _documentFile = file);
        } else {
          toast("Error loading content, please contact Globens support team!");
        }
      } else {
        toast("Error loading content, please contact Globens support team!");
      }
    }.call();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Center(child: SpinKitSquareCircle(color: Colors.blue, size: 50.0));

    if (_contentType == ContentType.MEDIA) {
      if (_chewieController != null && _videoPlayerController.value.isInitialized) body = Padding(padding: const EdgeInsets.all(8.0), child: Chewie(controller: _chewieController));
    } else if (_contentType == ContentType.DOCUMENT) {
      if (_documentFile != null) body = FileReaderView(filePath: _documentFile.path);
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(_content == null ? "" : _content.title, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: body,
    );
  }

  @override
  void dispose() {
    super.dispose();

    if (_contentType == ContentType.MEDIA) {
      _videoPlayerController.dispose();
      _chewieController.dispose();
    }
  }
}
