
import 'package:flutter/widgets.dart';

class ProductCategory {
  // region Variables
  String _text;
  List<String> _examples;
  Image _image;

  // endregion

  ProductCategory.create(String text, List<String> examples, Image image) {
    this._text = text;
    this._examples = examples;
    this._image = image;
  }

  // region Getters
  String get text {
    return _text;
  }

  List<String> get examples {
    return this._examples;
  }

  Image get icon {
    return _image;
  }
// endregion
}
