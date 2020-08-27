import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'widget_authentication.dart';

class Settings extends StatelessWidget {
  Widget signButton(BuildContext context) {
    if (AppUser.isAuthenticated())
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: 30.0,
              width: double.maxFinite,
              decoration: BoxDecoration(border: Border.all()),
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          AppUser.getProfileViewContainer(context));
                },
                child: Text("SIGN OUT"),
              ),
            )
          ],
        ),
      );
    else {
      return Container(

        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )),
            Container(
              margin: EdgeInsets.only(top:10, left: 10.0, right: 10.0),
              height: 30.0,
              width: double.maxFinite,
              decoration: BoxDecoration(border: Border.all()),
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticateWidget()));
                },
                child: Text("SIGN IN"),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: signButton(context));
  }
}
