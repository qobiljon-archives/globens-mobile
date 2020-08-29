
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class BusinessPageScreen extends StatefulWidget {
  @override
  _BusinessPageScreenState createState() => _BusinessPageScreenState();
}

class _BusinessPageScreenState extends State<BusinessPageScreen> {
  List<BusinessPage> pages = List<BusinessPage>();

  void _onCreateProductPressed() async {
    await showCupertinoModalBottomSheet(context: context, builder: (context, scrollController) => PersonalBusinessPage());
  }

  Widget getListViewItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("${pages[index].profileImageUrl}"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "${pages[index].displayName}",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String sessionKey = ""; // todo get sessionKey from userPreferences
    grpcFetchBusinessPages(sessionKey = sessionKey).then((array) {
      setState(() {
        pages.clear();
        pages.addAll(array);
      });
    });

    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Pages",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
                  )),
            ],
          ),
          /*Container(
              margin: EdgeInsets.only(top: 30.0),
              child: new ListView.builder(
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) => getListViewItem(context, index),
              ),
            ),*/
          Container(
            height: 30.0,
            margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            width: double.maxFinite,
            decoration: BoxDecoration(border: Border.all()),
            child: RaisedButton(
              onPressed: _onCreateProductPressed,
              color: Colors.white,
              child: Text("Create a business page"),
            ),
          )
        ],
      ),
    );
  }
}

class PersonalBusinessPage extends StatefulWidget {
  @override
  _PersonalBusinessPageState createState() => _PersonalBusinessPageState();
}

//temporary
class _PersonalBusinessPageState extends State<PersonalBusinessPage> {
  final name = TextEditingController();
  var firstCamera;





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
                      onTap: (){

                      },
                      child: Container(width: 60, height: 60, child: Image.asset("assets/profile_image.png")),
                    ),
                  ),
                  Flexible(
                      child: TextField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter the name",
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
                child: Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
