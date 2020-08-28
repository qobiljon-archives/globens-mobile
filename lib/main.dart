import 'package:flutter/material.dart';
import 'package:globens_flutter_client/widgets/Root%20tabs%20screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Globens",
    home: RootTabsScreen(),
    initialRoute: 'root',
    routes: {
      'root': (context) => RootTabsScreen(),
    },
  ));
}
