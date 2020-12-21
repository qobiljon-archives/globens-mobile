import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/Product.dart';
import 'package:globens_flutter_client/widgets/modal_views/product%20category%20modal%20view.dart';

import 'individual_product_widget.dart';

class CategoriesGridView extends StatefulWidget {
  final screenWidth, screenHeight;

  CategoriesGridView({this.screenWidth, this.screenHeight});

  @override
  _CategoriesGridViewState createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  List<String> _availableCategories = ["Education", "Job", "Consultation", "Others"];
  List<IconData> _availableCategoryImages = [Icons.school_outlined, Icons.work, Icons.contact_support, Icons.menu];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ProductCategory(categoryName: _availableCategories[index], iconData: _availableCategoryImages[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: widget.screenWidth * 0.05, mainAxisSpacing: widget.screenHeight * 0.01),
    );
  }
}
