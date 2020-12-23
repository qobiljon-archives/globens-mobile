import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  final String categoryName;
  final Image image;
  final Color color;

  ProductCategory({this.categoryName, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Card(

              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              elevation: 5.0,
              child: buildCatergoryContext(context)
          );
        });
  }


  Widget buildCatergoryContext(BuildContext context) {
    return Row(
      children: [
        Text(categoryName),
        image
      ],
    );
  }
}
