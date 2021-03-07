import 'package:globens_flutter_client/utils/Locale.dart';
import 'dart:typed_data';
import 'dart:convert';

class ProductCategory {
  // region Variables
  int _id;
  dynamic _name;
  Uint8List _pictureBlob;
  dynamic _examples;

  // endregion

  ProductCategory.create(int id, String nameJsonStr, String examplesJsonStr, Uint8List pictureBlob) {
    this._id = id;
    this._name = jsonDecode(nameJsonStr);
    this._examples = jsonDecode(examplesJsonStr);
    this._pictureBlob = pictureBlob;
  }

  // region Getters
  List<String> get examples => _examples[Language.languageCodeStringFromInt(Locale.languageCode)].cast<String>();

  Uint8List get pictureBlob => _pictureBlob;

  String get name => _name[Language.languageCodeStringFromInt(Locale.languageCode)] as String;

  int get id => _id;

  bool get isVacancyCategory => _id == 4;
// endregion
}
