import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("Education"),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("Consultation"),
        )
      ],
    );
  }
}
