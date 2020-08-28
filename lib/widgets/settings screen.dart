import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'authentication modal view.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _signedIn;

  void _signOutPressed() async {
    await AppUser.signOut();
    setState(() {
      _signedIn = AppUser.isAuthenticated();
    });
  }

  void _signInPressed() async {
    await showModalBottomSheet(context: context, builder: (context) => AuthenticationWidget());
    setState(() {
      _signedIn = AppUser.isAuthenticated();
    });
  }

  @override
  Widget build(BuildContext context) {
    _signedIn = AppUser.isAuthenticated();

    return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: this._signedIn
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    height: 30.0,
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: _signOutPressed,
                      child: Text("SIGN OUT"),
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
                    height: 30.0,
                    width: double.maxFinite,
                    child: RaisedButton(
                      onPressed: _signInPressed,
                      child: Text("SIGN IN"),
                    ),
                  )
                ],
              )
    );
  }
}
