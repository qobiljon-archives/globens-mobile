import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final String categoryName;
  final iconData;

  const ProductCategory({this.categoryName,  this.iconData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: 50,
        height: 50,
        child: Card(
          child: Column(
            children: [
             Container(child:  Icon(iconData),),
              Container(
                child: Text(categoryName),
              )
            ],
          ),
        ),
      );
    });
  }
}
