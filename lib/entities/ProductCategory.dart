import 'package:flutter_svg/flutter_svg.dart';

class ProductCategory{
  ProductCategory.create(String text, SvgPicture icon) {
    this._text = text;
    this._icon = icon;
  }

  String _text;
  SvgPicture  _icon;

  String get text {
    return _text;
  }
  SvgPicture get icon {
    return _icon;
  }
}