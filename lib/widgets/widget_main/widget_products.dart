import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all()),
      child: GridView.count(
        childAspectRatio: 3,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: List.generate(5, (index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border.all()),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {},
              child: Text("buttonn $index"),

            ),
          );
        }),
      ),
    );
  }
}
