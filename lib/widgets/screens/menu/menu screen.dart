import 'package:globens_flutter_client/widgets/modal_views/authentication%20modal%20view.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        getTitleWidget("App menu", textColor: Colors.black),
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
    );
  }

  void _signOutPressed() async {
    await AppUser.signOut();
    await Navigator.of(context).pushReplacementNamed('/');
  }

  void _signInPressed() async {
    await showModalBottomSheet(context: context, builder: (context) => AuthenticationModalView.getModalView(context));
    await Navigator.of(context).pushReplacementNamed('/');
  }
}
