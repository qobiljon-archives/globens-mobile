import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:flutter/material.dart';

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
              Locale.get("Select language"),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                Language.languagePrettyStringFromInt(Language.UZBEK),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/uz.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, Language.UZBEK),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                Language.languagePrettyStringFromInt(Language.RUSSIAN),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/ru.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, Language.RUSSIAN),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                Language.languagePrettyStringFromInt(Language.ENGLISH),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/us.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, Language.ENGLISH),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: RaisedButton.icon(
              label: Text(
                Language.languagePrettyStringFromInt(Language.KOREAN),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon: Image.asset(
                'icons/flags/png/kr.png',
                package: 'country_icons',
                width: 40,
                height: 25,
                fit: BoxFit.cover,
              ),
              onPressed: () => _onLanguagePressed(context, Language.KOREAN),
            ),
          ),
        ],
      ),
    );
  }

  static void _onLanguagePressed(BuildContext context, int languageCode) {
    AppUser.userPrefs.setInt("language", languageCode);
    Locale.languageCode = languageCode;
    Navigator.of(context).pop();
  }
}
