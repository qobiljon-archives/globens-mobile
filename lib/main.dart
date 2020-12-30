import 'package:globens_flutter_client/widgets/screens/my_pages/business%20page%20details%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/my_pages/job%20applications%20list%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/globens/vacant%20jobs%20list%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/root%20tabs%20screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData(primaryColor: Colors.white, primaryColorBrightness: Brightness.light, brightness: Brightness.light, primaryColorDark: Colors.black, canvasColor: Colors.white, appBarTheme: AppBarTheme(brightness: Brightness.light), textTheme: GoogleFonts.latoTextTheme()),
    debugShowCheckedModeBanner: false,
    title: "Globens",
    initialRoute: '/',
    routes: {
      '/': (context) => RootTabsScreen(),
      '/vacant_jobs': (context) => VacantJobsListScreen(),
      '/business_page_details': (context) => BusinessPageDetailsScreen(),
      '/business_page_details/job_applications_list': (context) => JobApplicationsListScreen(),
    },
  ));
}
