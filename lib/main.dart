import 'package:globens_flutter_client/widgets/screens/ProductCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/GlobensScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages/BusinessPageDetailsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages/JobApplicationsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/VacantJobsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/CategoryProductsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData(
      primaryColor: Color.fromRGBO(240, 242, 245, 1),
      primaryColorBrightness: Brightness.light,
      brightness: Brightness.light,
      primaryColorDark: Colors.black,
      canvasColor: Colors.white,
      appBarTheme: AppBarTheme(brightness: Brightness.light),
      textTheme: GoogleFonts.latoTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    title: "Globens",
    initialRoute: '/',
    routes: {
      RootTabsScreen.route_name: (context) => RootTabsScreen(),
      CategoryProductsScreen.route_name: (context) => CategoryProductsScreen(),
      VacantJobsListScreen.route_name: (context) => VacantJobsListScreen(),
      ProductPurchaseScreen.route_name: (context) => ProductPurchaseScreen(),
      BusinessPageDetailsScreen.route_name: (context) => BusinessPageDetailsScreen(),
      JobApplicationsListScreen.route_name: (context) => JobApplicationsListScreen(),
      ProductCreatorScreen.route_name: (context) => ProductCreatorScreen(),
    },
  ));
}
