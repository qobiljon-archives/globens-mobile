import 'dart:io';

import 'package:globens_flutter_client/widgets/screens/CountrySelectionScreen.dart';
import 'package:globens_flutter_client/widgets/screens/LanguageSelectorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:globens_flutter_client/utils/CountryHelper.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:path_provider/path_provider.dart';

class MenuScreen extends StatefulWidget {
  final RootTabsScreenState rootTabsScreenState;

  MenuScreen(this.rootTabsScreenState);

  @override
  State<StatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var _globensCacheSizeBytes = 0;

  @override
  void initState() {
    super.initState();
    _calculateGlobensCacheSize().then((value) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 32),
        CircleAvatar(radius: 40, child: ClipOval(child: AppUser.isAuthenticated() ? Image.network(AppUser.profileImageUrl) : Image.asset("assets/placeholder_avatar.jpg"))),
        SizedBox(height: 10),
        Center(child: Text(AppUser.isAuthenticated() ? AppUser.displayName : Locale.get("Anonymous user"), style: TextStyle(fontSize: 20.0, color: Colors.black))),
        Center(child: Text(AppUser.isAuthenticated() ? AppUser.email : Locale.get("Sign in"), style: GoogleFonts.lato(fontSize: 14.0, color: Colors.black))),
        SizedBox(height: 10),
        if (AppUser.isAuthenticated()) ActionChip(onPressed: _signOutPressed, avatar: Image.asset(AppUser.authMethod == AuthMethod.GOOGLE ? 'assets/auth_google.png' : 'assets/auth_apple.png', width: 25, fit: BoxFit.cover), label: Text(Locale.get("Sign in with Google account"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        if (!AppUser.isAuthenticated()) ActionChip(onPressed: _googleSignInPressed, avatar: Image.asset('assets/auth_google.png', width: 25, fit: BoxFit.cover), label: Text(Locale.get("Sign in with Google account"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
        if (!AppUser.isAuthenticated() && Platform.isIOS) ActionChip(onPressed: _appleSignInPressed, avatar: Image.asset('assets/auth_apple.png', width: 25, fit: BoxFit.cover), label: Text(Locale.get("Sign in with Apple"), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), backgroundColor: Colors.black),
        SizedBox(height: 10),
        Container(height: 16, decoration: BoxDecoration(color: Colors.black12)),
        if (AppUser.isAuthenticated())
          InkWell(
              onTap: _setCountryPressed,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.flag_outlined),
                    SizedBox(width: 10),
                    Text(Locale.get("Country"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(CountryHelper.countryName(AppUser.countryCode), style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                    Icon(Icons.chevron_right_sharp, color: Colors.black),
                  ],
                ),
              )),
        Divider(height: 1, color: Colors.black12),
        InkWell(
            onTap: _setLanguagePressed,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.language),
                  SizedBox(width: 10),
                  Text(Locale.get("Language"), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(AppUser.userPrefs.getInt("language") != null ? Language.languagePrettyStringFromInt(AppUser.userPrefs.getInt("language")) : "English", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                  Icon(Icons.chevron_right_sharp, color: Colors.black),
                ],
              ),
            )),
        InkWell(
            onTap: _onClearCachePressed,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.data_usage_rounded),
                  SizedBox(width: 10),
                  Text(Locale.get("Globens app cache : ${Locale.REPLACE} MB", (_globensCacheSizeBytes / 1000000).toStringAsFixed(1)), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(Locale.get('Clean'), style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                  Icon(Icons.chevron_right_sharp, color: Colors.black),
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

  void _googleSignInPressed() async {
    if (await AppUser.signIn(AuthMethod.GOOGLE))
      await toast(Locale.get("Signed in with Google."));
    else
      await toast(Locale.get("Failed to login with Google.\nPlease try again later!"));

    setState(() {});
  }

  void _appleSignInPressed() async {
    if (await AppUser.signIn(AuthMethod.APPLE))
      await toast(Locale.get("Signed in with Google."));
    else
      await toast(Locale.get("Failed to login with Google.\nPlease try again later!"));

    setState(() {});
  }

  void _signOutPressed() async {
    await AppUser.signOut();
    setState(() {});
  }

  void _setLanguagePressed() async {
    await Navigator.of(context).pushNamed(LanguageSelectorScreen.route_name);
    setState(() {});
  }

  void _setCountryPressed() async {
    await Navigator.of(context).pushNamed(CountrySelectionScreen.route_name, arguments: AppUser.countryCode);
    if (CountrySelectionScreen.resultCountryCode != null) {
      AppUser.setProfileInfo(countryCode: CountrySelectionScreen.resultCountryCode);
      AppUser.updateUserPrefsData();
      setState(() {});
    }
  }

  Future<void> _calculateGlobensCacheSize() async {
    var dir = await getApplicationDocumentsDirectory();
    var cacheDir = Directory("${dir.path}/globens_cache");
    _globensCacheSizeBytes = 0;
    await for (var item in cacheDir.list()) {
      if (item is File) _globensCacheSizeBytes += item.lengthSync();
    }
  }

  void _onClearCachePressed() async {
    getApplicationDocumentsDirectory().then((dir) async {
      var cacheDir = Directory("${dir.path}/globens_cache");
      await cacheDir.delete(recursive: true);
      await cacheDir.create();
      await _calculateGlobensCacheSize();
      setState(() {});
    });
  }
}
