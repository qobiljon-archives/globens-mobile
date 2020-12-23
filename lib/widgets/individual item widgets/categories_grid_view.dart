import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/individual%20item%20widgets/individual_category_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  List<Widget> _icons = [
    SvgPicture.asset("assets/education.svg"),
    SvgPicture.asset("assets/job.svg"),
    SvgPicture.asset("assets/consulting.svg"),
    SvgPicture.asset("assets/others.svg"),
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
          iconData: _icons[index],
          color: _colors[index],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: widget.screenWidth * 0.05, mainAxisSpacing: widget.screenHeight * 0.01),
    );
  }
}
