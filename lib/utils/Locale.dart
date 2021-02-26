import 'dart:collection';

import 'package:globens_flutter_client/entities/AppUser.dart';

class Language {
  static final ENGLISH = -1;
  static final RUSSIAN = 0;
  static final KOREAN = 1;
  static final UZBEK = 2;
}

class Locale {
  int languageCode = Language.ENGLISH;

  Locale(this.languageCode);

  static Locale language() {
    final langCode = AppUser.userPrefs.getInt("language");
    return langCode != null ? Locale(langCode) : Locale(langCode);
  }

  String get(String s) {
    if (this._stringsMap.containsKey(s)) {
      if (0 <= languageCode && languageCode < _stringsMap[s].length) return _stringsMap[s][languageCode];
    }
    return s;
  }

  // Add new strings in the format of ENGLISH: [RUSSIAN, KOREAN, UZBEK]
  Map<String, List<String>> _stringsMap = {
    "SELECT LANGUAGE": ["ВЫБЕРИТЕ ЯЗЫКA", "언어 선택", "TILNI TANLANG"],
  };
}
