import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          child: Text(
            "Authorization",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: RaisedButton(
                  child: Text("phone"),
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: RaisedButton(
                  child: Text("phone"),
                  onPressed: () {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: RaisedButton(
                  child: Text("phone"),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.all(1.5),
                width: MediaQuery.of(context).size.width * 0.8,
                child: RaisedButton(
                  child: Text("phone"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
