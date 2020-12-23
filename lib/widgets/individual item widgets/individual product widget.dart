import 'package:flutter/material.dart';

class IndividualProduct extends StatelessWidget {
  final String categoryName;
  final imageBytes;


  const IndividualProduct({this.categoryName, this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: MemoryImage(imageBytes),
            ),
            Container(
              child: Text(categoryName),
            )
          ],
        ),
      ),
    );
  }
}



