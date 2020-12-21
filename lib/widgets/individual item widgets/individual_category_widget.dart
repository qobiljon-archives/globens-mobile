import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final String categoryName;
  final IconData iconData;

  ProductCategory({this.categoryName, this.iconData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Card(
        elevation: 5.0,
        child: Column(
          children: [Icon(iconData), Text(categoryName)],
        ),
      );
    });
  }
}
