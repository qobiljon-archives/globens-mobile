import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'package:globens_flutter_client/utils/utils.dart';

class LanguageModalView {
  static Widget getModalView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "SELECT LANGUAGE",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                'Uzbek',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/uz.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, "uz"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                'Russian',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/ru.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, "ru"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                'English',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/us.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, "eng"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                'Korean',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/kr.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, "eng"),
            ),
          ),
        ],
      ),
    );
  }

  static void _onLanguagePressed(BuildContext context, String languageCode) {
    toast(languageCode);
    Navigator.of(context).pop();
  }
}
