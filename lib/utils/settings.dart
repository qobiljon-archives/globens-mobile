import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final String grpc_host = '165.246.42.173';
final int grpc_port = 50053;

Widget getTitleWidget(String text, {Color textColor = Colors.blue}) {
  return Container(
    margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0, bottom: 20.0),
    child: Text(
      text,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: textColor),
    ),
  );
}

Widget getTitleWidgetForProducts(String page_category, String businesspage_name, Function pressButton) {
  return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: pressButton,
              ),
              Text(
                page_category,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
          Container(

           // alignment: Alignment.topLeft,
            child: Text(
              "$businesspage_name",

              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
        ],
      ));
}
