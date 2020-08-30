import 'package:flutter/material.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/settings.dart';
import 'authentication modal view.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          getTitleWidget("Menu", textColor: Colors.black),
          AppUser.isAuthenticated()
              ? RaisedButton(
                  onPressed: _signOutPressed,
                  child: Text("Sign out"),
                )
              : RaisedButton(
                  onPressed: _signInPressed,
                  child: Text("Sign in"),
                )
        ],
      ),
    );
  }

  void _signOutPressed() async {
    await AppUser.signOut();
    Navigator.of(context).pushReplacementNamed('rooot');
  }

  void _signInPressed() async {
    await showModalBottomSheet(context: context, builder: (context) => AuthenticationWidget());
    Navigator.of(context).pushReplacementNamed('root');
  }
}
