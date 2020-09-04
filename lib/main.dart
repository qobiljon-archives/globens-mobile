import 'package:globens_flutter_client/widgets/root%20tabs%20screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    // Change it as you want
    theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.light,
        primaryColorDark: Colors.black,
        canvasColor: Colors.white,
        // next line is important!
        appBarTheme: AppBarTheme(brightness: Brightness.light)),
    darkTheme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        primaryColorLight: Colors.black,
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        // next line is important!
        appBarTheme: AppBarTheme(brightness: Brightness.dark)),

    debugShowCheckedModeBanner: false,
    title: "Globens",
    home: RootTabsScreen(),
    initialRoute: 'root',

    routes: {
      'root': (context) => RootTabsScreen(),
    },
  ));
}
