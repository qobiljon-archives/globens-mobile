import 'package:globens_flutter_client/widgets/modal_views/AuthenticationModalView.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        getUserProfileWidget(),
        Container(
          margin: EdgeInsets.all(20),
          child: RaisedButton.icon(
            onPressed: AppUser.isAuthenticated() ? _signOutPressed : _signInPressed,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            icon: Icon(
              AppUser.isAuthenticated() ? Icons.logout : Icons.login,
              color: Colors.white,
            ),
            label: Text(
              "SIGN ${AppUser.isAuthenticated() ? 'OUT' : 'IN'}",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Text("Language", style: TextStyle(fontSize: 20))
      ],
    );
  }

  void _signOutPressed() async {
    await AppUser.signOut();
    setState(() {});
  }

  void _signInPressed() async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => AuthenticationModalView.getModalView(context));
    setState(() {});
  }
}
