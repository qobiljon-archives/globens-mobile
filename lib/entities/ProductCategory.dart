import 'package:flutter_svg/flutter_svg.dart';

class ProductCategory {
  // region Variables
  String _text;
  List<String> _examples;
  SvgPicture _icon;

  // endregion

  ProductCategory.create(String text, List<String> examples, SvgPicture icon) {
    this._text = text;
    this._examples = examples;
    this._icon = icon;
  }

  // region Getters
  String get text {
    return _text;
  }

  List<String> get examples {
    return this._examples;
  }

  SvgPicture get icon {
    return _icon;
  }
// endregion
}
