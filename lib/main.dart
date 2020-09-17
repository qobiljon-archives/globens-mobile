import 'package:globens_flutter_client/widgets/screens/globens/products%20list%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/my_pages/business%20page%20details%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/my_pages/job%20applications%20list%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/vacant%20jobs%20list%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/root%20tabs%20screen.dart';
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
        // text line is important!
        appBarTheme: AppBarTheme(brightness: Brightness.dark)),

    debugShowCheckedModeBanner: false,
    title: "Globens",
    initialRoute: '/',

    routes: {
      '/': (context) => RootTabsScreen(),
      '/products_list': (context) => ProductsListScreen(),
      '/vacant_jobs': (context) => VacantJobsListScreen(),
      '/business_page_details': (context) => BusinessPageDetailsScreen(),
      '/business_page_details/job_applications_list': (context) => JobApplicationsListScreen(),
    },
  ));
}
