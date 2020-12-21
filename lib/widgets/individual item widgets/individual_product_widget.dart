import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: GridTile(
        child: Image.memory(product.pictureBlob),
        footer: GestureDetector(
          onTap: () {
          },
          child: GridTileBar(
            title: titleWidget(product.name),
            backgroundColor: Colors.black54,
          ),
        ),
      ),
    );
  }
  Widget titleWidget(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
    );
  }

}
