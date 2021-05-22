import 'dart:ui';

import 'package:globens_flutter_client/widgets/screens/CountrySelectionScreen.dart';
import 'package:globens_flutter_client/widgets/screens/LanguageSelectionScreen.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
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
        SizedBox(
          height: 32,
        ),
        CircleAvatar(
          radius: 40,
          child: ClipOval(
            child: AppUser.isAuthenticated() ? Image.network(AppUser.profileImageUrl) : Image.asset("assets/placeholder_avatar.jpg"),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(AppUser.isAuthenticated() ? AppUser.displayName : Locale.get("Anonymous user"), style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ),
        Center(
          child: Text(
            AppUser.isAuthenticated() ? AppUser.email : Locale.get("Sign in"),
            style: GoogleFonts.lato(fontSize: 14.0, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ActionChip(
          onPressed: AppUser.isAuthenticated() ? _signOutPressed : _signInPressed,
          avatar: Image.asset(
            'assets/auth_google.png',
            width: 25,
            fit: BoxFit.cover,
          ),
          label: Text(
            AppUser.isAuthenticated() ? Locale.get("Sign out") : Locale.get("Sign in with Google account"),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 16,
          decoration: BoxDecoration(color: Colors.black12),
        ),
        InkWell(
            onTap: _setCountryPressed,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.flag_outlined,
                  ),
                  SizedBox(width: 10),
                  Text(
                    Locale.get("Country"),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    AppUser.userPrefs.getString("country") != null ? AppUser.userPrefs.getString("country") : "Korea",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            )),
        Divider(
          height: 1,
          color: Colors.black12,
        ),
        InkWell(
            onTap: _setLanguagePressed,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                  ),
                  SizedBox(width: 10),
                  Text(
                    Locale.get("Language"),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    AppUser.userPrefs.getInt("language") != null ? Language.languagePrettyStringFromInt(AppUser.userPrefs.getInt("language")) : "English",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            )),
        Divider(
          height: 1,
          color: Colors.black12,
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
    await Navigator.of(context).pushNamed(LanguageSelectionScreen.route_name);
    setState(() {});
  }

  void _setCountryPressed() async {
    await Navigator.of(context).pushNamed(CountrySelectionScreen.route_name);
    setState(() {});
  }
}
