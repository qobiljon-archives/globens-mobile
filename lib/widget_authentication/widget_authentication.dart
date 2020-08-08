import 'package:flutter/material.dart';

class AuthenticateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            "User authentication",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.only(top: 100.0),
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                decoration: BoxDecoration(border: Border.all()),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 0.0,
                  child: Text(
                    "Phone number",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                decoration: BoxDecoration(border: Border.all()),
                child: RaisedButton(
                  child: Text(
                    "Kakaotalk",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: () {},
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                decoration: BoxDecoration(border: Border.all()),
                child: RaisedButton(
                  child: Text(
                    "Google",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  onPressed: () {},
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(border: Border.all()),
                child: RaisedButton(
                  child: Text(
                    "Facebook",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.white,
                  elevation: 0.0,
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
