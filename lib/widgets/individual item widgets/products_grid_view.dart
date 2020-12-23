
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Product.dart';

import 'individual product widget.dart';

class ProductsGridView extends StatefulWidget {
  final screenWidth, screenHeight;
 final List<Product> products;


  ProductsGridView({this.screenWidth, this.screenHeight, this.products});

  @override
  _ProductsGridViewState createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth,
        height:widget.screenHeight*0.35,
        child: GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.products.length,
      shrinkWrap: true,
       scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return IndividualProduct(
            categoryName: widget.products[index].name,
            imageBytes: widget.products[index].pictureBlob);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: widget.screenWidth * 0.05,
          mainAxisSpacing: widget.screenHeight * 0.01),
    ));
  }
}
