import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';


class BusinessPage extends StatelessWidget {
  Widget userDetails() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("${AppUser.profileImageUrl}"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              "${AppUser.displayName}",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Business Page",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
              ],
            ),
            userDetails(),
            Container(
              height: 30.0,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              width: double.maxFinite,
              decoration: BoxDecoration(border: Border.all()),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Text("Create your product"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
