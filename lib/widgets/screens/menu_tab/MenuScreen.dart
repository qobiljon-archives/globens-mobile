import 'package:globens_flutter_client/widgets/modal_views/LanguageModalView.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:flutter/material.dart';

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
        getTitleWidget(Locale.get("App menu"), textColor: Colors.black),
        getUserProfileWidget(),
        Container(
          margin: EdgeInsets.all(20),
          child: RaisedButton.icon(
            onPressed: AppUser.isAuthenticated() ? _signOutPressed : _signInPressed,
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            icon: Image.asset(
              'assets/auth_google.png',
              width: 25,
              fit: BoxFit.cover,
            ),
            label: Text(
              AppUser.isAuthenticated() ? Locale.get("Sign out") : Locale.get("Sign in with Google account"),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: RaisedButton.icon(
            onPressed: _setLanguagePressed,
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            icon: Icon(
              Icons.language_rounded,
              color: Colors.white,
            ),
            label: Text(
              Locale.get("Language"),
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
    if (await AppUser.signIn(AuthMethod.GOOGLE))
      await toast(Locale.get("Signed in with Google."));
    else
      await toast(Locale.get("Failed to login with Google.\nPlease try again later!"));

    setState(() {});
  }

  void _setLanguagePressed() async {
    await showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => LanguageModalView.getModalView(context));
    setState(() {});
  }
}
