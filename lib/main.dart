import 'package:globens_flutter_client/widgets/screens/ProductPurchaseScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages/BusinessPageDetailsScreen.dart';
import 'package:globens_flutter_client/widgets/screens/pages/JobApplicationsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/VacantJobsListScreen.dart';
import 'package:globens_flutter_client/widgets/screens/CategoryProductsScreen.dart';
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
      '/': (context) => RootTabsScreen(),
      '/category_products': (context) => CategoryProductsScreen(),
      '/vacant_jobs': (context) => VacantJobsListScreen(),
      '/product_purchase': (context) => ProductPurchaseScreen(),
      '/business_page_details': (context) => BusinessPageDetailsScreen(),
      '/business_page_details/job_applications_list': (context) => JobApplicationsListScreen(),
    },
  ));
}
