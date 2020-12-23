import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/individual%20item%20widgets/individual_category_widget.dart';

class CategoriesGridView extends StatefulWidget {
  final screenWidth, screenHeight;

  CategoriesGridView({this.screenWidth, this.screenHeight});

  @override
  _CategoriesGridViewState createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  List<String> _availableCategories = [
    "Education",
    "Job",
    "Consultation",
    "Others",
  ];
  List<Image> _availableCategoryImages = [
    Image.asset("education.png"),
    Image.asset("consultation.png"),
    Image.asset("job.png"),
    Image.asset("others.png"),
  ];
  List<Color> _colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: 4,
      itemBuilder: (context, index) {
        return ProductCategory(
          categoryName: _availableCategories[index],
          image: _availableCategoryImages[index],
          color: _colors[index],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: widget.screenWidth * 0.05,
          mainAxisSpacing: widget.screenHeight * 0.01),
    );
  }
}
