import 'package:globens_flutter_client/widgets/screens/pages_tab/BusinessPageDetailsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages_tab/JobApplicationsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/globens_tab/CategoryProductsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/JobApplicationCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/BusinessPageCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/LanguageSelectorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/CountrySelectionScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';
import 'package:globens_flutter_client/widgets/screens/VacancyCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductReviewsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductCreatorScreen.dart';
import 'package:globens_flutter_client/widgets/screens/EmployeeReviewScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ProductViewerScreen.dart';
import 'package:globens_flutter_client/widgets/screens/ContentViewerScreen.dart';
import 'package:globens_flutter_client/widgets/screens/RootTabsScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getApplicationDocumentsDirectory().then((dir) {
    var dataDir = Directory("${dir.path}/globens_cache");
    if (!dataDir.existsSync()) dataDir.create();
    print(dataDir);
  });

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
    // debugShowCheckedModeBanner: false,
    title: "Globens",
    initialRoute: '/',
    routes: {
      RootTabsScreen.route_name: (context) => RootTabsScreen(),
      CategoryProductsScreen.route_name: (context) => CategoryProductsScreen(),
      ProductPurchaseScreen.route_name: (context) => ProductPurchaseScreen(),
      BusinessPageDetailsScreen.route_name: (context) => BusinessPageDetailsScreen(),
      JobApplicationsListScreen.route_name: (context) => JobApplicationsListScreen(),
      ProductViewerScreen.route_name: (context) => ProductViewerScreen(),
      ProductCreatorScreen.route_name: (context) => ProductCreatorScreen(),
      ContentViewerScreen.route_name: (context) => ContentViewerScreen(),
      EmployeeReviewScreen.route_name: (context) => EmployeeReviewScreen(),
      ProductReviewsScreen.route_name: (context) => ProductReviewsScreen(),
      CountrySelectionScreen.route_name: (context) => CountrySelectionScreen(),
      LanguageSelectorScreen.route_name: (context) => LanguageSelectorScreen(),
      BusinessPageCreatorScreen.route_name: (context) => BusinessPageCreatorScreen(),
      VacancyCreatorScreen.route_name: (context) => VacancyCreatorScreen(),
      JobApplicationCreatorScreen.route_name: (context) => JobApplicationCreatorScreen(),
    },
  ));
}
