import 'package:globens_flutter_client/widgets/modal_views/AuthenticationModalView.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/modal_views/LanguageModalView.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';

class MenuScreen extends StatefulWidget {
  final RootTabsScreenState rootTabsScreenState;
  
  MenuScreen(this.rootTabsScreenState);

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
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: RaisedButton.icon(
            onPressed: _setLanguagePressed,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            icon: Icon(
              Icons.language_rounded,
              color: Colors.white,
            ),
            label: Text(
              'Language',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
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

  void _setLanguagePressed() async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => LanguageModalView.getModalView(context));
    setState(() {});
  }
}
