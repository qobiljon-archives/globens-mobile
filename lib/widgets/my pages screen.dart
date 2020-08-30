import 'dart:io';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';

class PagesScreen extends StatefulWidget {
  @override
  _PagesScreenState createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  List<Widget> _header = [];
  List<BusinessPage> _body = [];
  List<Widget> _footer = [];
  BuildContext _context;

  @override
  void initState() {
    super.initState();

    _header = [getTitleWidget("My pages", textColor: Colors.black)];
    _footer = [
      RaisedButton(
        onPressed: () {
          _onCreateProductPressed();
        },
        child: Text("Create"),
      )
    ];
    grpcFetchBusinessPages(AppUser.sessionKey).then((array) {
      setState(() {
        _body = array;
      });
    });
  }

  @override
  Widget build(context) {
    this._context = context;
    return Container(
      child: ListView.builder(
        itemCount: _header.length + _body.length + _footer.length,
        itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
      ),
    );
  }

  Widget getListViewItem(BuildContext context, int index) {
    if (index < _header.length)
      return _header[index];
    else if (index >= _header.length + _body.length)
      return _footer[index - _footer.length - _body.length];
    else
      return buildBusinessPageItem(index - _header.length);
  }

  Widget buildBusinessPageItem(int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: MemoryImage(_body[index].pictureBlob),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "${_body[index].title}",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  void _onCreateProductPressed() {
    showCupertinoModalBottomSheet(context: this._context, builder: (context, scrollcontroller) => PersonalBusinessPage());
  }
}

class PersonalBusinessPage extends StatefulWidget {
  @override
  _PersonalBusinessPageState createState() => _PersonalBusinessPageState();
}

class _PersonalBusinessPageState extends State<PersonalBusinessPage> {
  final name = TextEditingController();

  void openOptions(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => PhotoOptions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Text(
                "Personal Business Page",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        openOptions(context);
                      },
                      child: Container(width: 60, height: 60, child: Image.asset("assets/profile_image.png")),
                    ),
                  ),
                  Flexible(
                      child: TextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "BusinessPage name",
                      hintText: "Enter your businesspage name",
                    ),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 30.0,
              decoration: BoxDecoration(border: Border.all()),
              child: FlatButton(
                onPressed: () {},
                child: Text("Create"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotoOptions extends StatefulWidget {
  @override
  _PhotoOptionsState createState() => _PhotoOptionsState();
}

class _PhotoOptionsState extends State<PhotoOptions> {
  //region  open_gallery
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });

    print(_image);
  }

  //endregion
  //region open_camera
  static List<CameraDescription> cameras;

  Future<void> open_camera(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraApp()),
    );
  }

  //endregion
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: IconButton(
              icon: Icon(
                Icons.photo_camera,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          ),
          Container(
            child: IconButton(
                icon: Icon(
                  Icons.photo,
                  color: Colors.blue,
                ),
                onPressed: getImage),
          ),
        ],
      ),
    );
  }
}

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(_PhotoOptionsState.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(aspectRatio: controller.value.aspectRatio, child: CameraPreview(controller));
  }
}
