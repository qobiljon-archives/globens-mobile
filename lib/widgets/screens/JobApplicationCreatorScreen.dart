import 'package:globens_flutter_client/entities/JobApplication.dart';
import 'package:globens_flutter_client/entities/GlobensUser.dart';
import 'package:globens_flutter_client/utils/DriveHelper.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/Content.dart';
import 'package:globens_flutter_client/entities/Job.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'dart:io';

class JobApplicationCreatorScreen extends StatefulWidget {
  static const String route_name = '/job_application_creator_screen';

  @override
  State<StatefulWidget> createState() => _JobApplicationCreatorScreenState();
}

class _JobApplicationCreatorScreenState extends State<JobApplicationCreatorScreen> {
  final TextEditingController _applicantMessage = TextEditingController();
  GlobensUser applicantUser;
  List<File> _applicationAttachmentFiles = <File>[];
  Set<String> _uploadingFiles = Set();
  Job _job;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      _job = ModalRoute.of(context).settings.arguments as Job;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get("Job application form"), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          children: [
            Card(
              margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
              child: Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: TextField(
                  minLines: 14,
                  maxLines: 14,
                  controller: _applicantMessage,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: Locale.get("Your message goes here"), labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueAccent), hintText: Locale.get("e.g., I'm the applicant recommended by mr. John Doe"), border: InputBorder.none),
                ),
              ),
            ),
            if (_applicationAttachmentFiles.length > 0)
              Column(
                  children: _applicationAttachmentFiles
                      .map((file) => Card(
                          margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                          child: Container(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 2.5, bottom: 2.5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                if (_uploadingFiles.contains(file.path)) SizedBox(child: CircularProgressIndicator(), height: 24.0, width: 24.0),
                                if (!_uploadingFiles.contains(file.path)) Icon(getFileTypeIcon(file.path), color: Colors.black87, size: 30.0),
                                Flexible(child: Text(RegExp(r'^(.+/)(.+)$').firstMatch(file.path).group(2), overflow: TextOverflow.ellipsis)),
                                IconButton(
                                  onPressed: () => _removeFileContent(file),
                                  icon: Icon(Icons.highlight_remove_outlined, color: Colors.redAccent),
                                )
                              ]))))
                      .toList()),
            Container(
              margin: EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
              child: RaisedButton.icon(
                onPressed: _uploadingFiles.isNotEmpty ? null : _addUploadFilePressed,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                icon: Icon(Icons.attachment_outlined, color: Colors.white),
                label: Text(_applicationAttachmentFiles.length == 0 ? Locale.get("Attach files (e.g., CV, recommendations)") : Locale.get("Reselect attachments (e.g., CV)"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
              child: RaisedButton.icon(
                onPressed: _uploadingFiles.isNotEmpty ? null : () => _onSubmitApplicationFormPressed(_job),
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                icon: Icon(Icons.send_rounded, color: Colors.white),
                label: Text(Locale.get("Submit application form"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addUploadFilePressed() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      var selectedSupportedFiles = <File>[];
      for (var path in result.paths) if (getContentType(path) == ContentType.DOCUMENT) selectedSupportedFiles.add(new File(path));
      setState(() {
        _applicationAttachmentFiles = selectedSupportedFiles;
      });
    } else {
      toast(Locale.get("Selection cancelled!"));
    }
  }

  void _removeFileContent(File file) {
    setState(() {
      _applicationAttachmentFiles.remove(file);
    });
  }

  void _onSubmitApplicationFormPressed(Job job) async {
    if (_applicantMessage.text.length < 5) {
      await toast(Locale.get("Message can't be less than 5 characters."));
      return;
    }

    var contents = <Content>[];
    bool success = true;

    setState(() {
      for (File localFile in _applicationAttachmentFiles) _uploadingFiles.add(localFile.path);
    });

    if (_applicationAttachmentFiles.length == 0) {
      await toast(Locale.get("Your job application must have at least one attachment!"));
      return;
    } else {
      for (File localFile in _applicationAttachmentFiles) {
        var fileName = path.basename(localFile.path);
        var tp = await grpcCreateNewContent(AppUser.sessionKey, Content.create(fileName, "", ""));
        success &= tp.item1;
        if (success) {
          var id = tp.item2;
          var uploadedFile = await DriveHelper.uploadFile(fileName, localFile);
          success &= uploadedFile != null;
          if (success) {
            var content = Content.create(fileName, uploadedFile.item1, uploadedFile.item2, id: id);
            await grpcUpdateContent(AppUser.sessionKey, content);
            contents.add(content);
            setState(() {
              _uploadingFiles.remove(localFile.path);
            });
          }
        }
      }
    }

    success = await grpcCreateJobApplication(AppUser.sessionKey, job, JobApplication.create(_applicantMessage.text, contents, job));
    if (success) {
      await toast(Locale.get("Submitted"));
      Navigator.of(context).pop();
    } else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }
}
