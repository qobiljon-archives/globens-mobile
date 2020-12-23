import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCategory extends StatelessWidget {
  final String categoryName;
  final Widget iconData;
  final Color color;

  ProductCategory({this.categoryName, this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          elevation: 5.0,
          child: buildCatergoryContext(context));
    });
  }

  Widget buildCatergoryContext(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(width: 50, height: 50, child: iconData)
      ],
    );
  }
}
