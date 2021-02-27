import 'dart:io';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_filereader/flutter_filereader.dart';

class ContentViewer extends StatefulWidget {
  final String _fileName;

  ContentViewer(this._fileName);

  @override
  _ContentViewerState createState() => _ContentViewerState();
}

class _ContentViewerState extends State<ContentViewer> {
  Widget view;

  VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildStreamedFile());
  }

  Widget _buildStreamedFile() {
    String type = widget._fileName.split(".")[1];
    final filePath = "/data/user/0/uz.globens" + "/" + widget._fileName;

    switch (type) {
      case "pdf":
        {
          final pdfController = PdfController(document: PdfDocument.openFile(filePath));
          Widget pdfView() => PdfView(controller: pdfController);
          setState(() {
            view = pdfView();
          });

          return view;
        }
        break;
      case "mp4":
        {
          final file = File(filePath);
          _controller = VideoPlayerController.file(file);
          _controller.initialize().then((value) => print("value"));
          setState(() {
            view = VideoPlayer(_controller);
          });
          _controller.play();
          return view;
        }
        break;
      case "docx":
        {
          setState(() {
            view = FileReaderView(filePath: filePath);
          });
          return  view;
        }
        break;
      case "pptx":
        {}
        break;
      case "xls":
        {}
        break;
      case "jpeg":
        {}
        break;
      case "mp3":
        {}
    }
  }
}
