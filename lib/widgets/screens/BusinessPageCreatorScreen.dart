import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/utils/CountryHelper.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/entities/BusinessPage.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'dart:typed_data';

import 'package:globens_flutter_client/widgets/modal_views/PhotoSelectorModalView.dart';
import 'package:globens_flutter_client/widgets/screens/CountrySelectionScreen.dart';

class BusinessPageCreatorScreen extends StatefulWidget {
  static const String route_name = '/create_business_page_screen';

  @override
  State<StatefulWidget> createState() => _CreateBusinessPageState();
}

class _CreateBusinessPageState extends State<BusinessPageCreatorScreen> {
  TextEditingController _titleTextController = TextEditingController();
  Uint8List _businessPageImageBytes;
  String _countryCode;

  @override
  void initState() {
    super.initState();

    _countryCode = AppUser.countryCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
      appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.blue, title: Text(Locale.get("New business page"), overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
          shrinkWrap: true,
          children: [
            Container(
                height: 100,
                margin: EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () {
                      _selectImagePressed(context);
                    },
                    child: ClipRRect(borderRadius: BorderRadius.circular(20.0), child: Image(image: _businessPageImageBytes == null ? AssetImage('assets/placeholder_business_page.png') : MemoryImage(_businessPageImageBytes), width: 100)))),
            getSectionSplitter(Locale.get("Business details")),
            InkWell(
                onTap: _setCountryPressed,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.flag_outlined),
                      SizedBox(width: 10),
                      Text(Locale.get("Country"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(CountryHelper.countryName(_countryCode), style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                      Icon(Icons.chevron_right_sharp, color: Colors.black),
                    ],
                  ),
                )),
            Divider(height: 1, color: Colors.black12),
            TextField(controller: _titleTextController, decoration: InputDecoration(labelText: Locale.get("Name of business"), labelStyle: TextStyle(color: Colors.blueAccent), hintText: Locale.get("e.g., SpaceX"))),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton.icon(
                  onPressed: _createBusinessPagePressed,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  icon: Icon(
                    Icons.upload_file,
                    color: Colors.white,
                  ),
                  label: Text(
                    Locale.get("Create"),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _selectImagePressed(BuildContext context) async {
    PhotoSelectorModalView.resultImageBytes = null;
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => PhotoSelectorModalView.getContainer(context));

    if (PhotoSelectorModalView.resultImageBytes != null)
      setState(() {
        _businessPageImageBytes = PhotoSelectorModalView.resultImageBytes;
      });
  }

  void _createBusinessPagePressed() async {
    if (_titleTextController.text.length < 2) {
      await toast(Locale.get("Title must be at least two characters"));
      return;
    }
    if (_businessPageImageBytes == null) {
      await toast(Locale.get("A business page must have an icon"));
      return;
    }

    bool success = await grpcCreateBusinessPage(AppUser.sessionKey, BusinessPage.create(_titleTextController.text, _businessPageImageBytes, _countryCode));

    if (success)
      Navigator.of(context).pop();
    else {
      await AppUser.signOut();
      await Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _setCountryPressed() async {
    await Navigator.of(context).pushNamed(CountrySelectionScreen.route_name, arguments: _countryCode);

    if (CountrySelectionScreen.resultCountryCode != null) {
      setState(() {
        _countryCode = CountrySelectionScreen.resultCountryCode;
      });
    }
  }
}
