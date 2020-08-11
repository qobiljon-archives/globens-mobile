import 'package:flutter/material.dart';
import '../widget_main/widget_products.dart';
import '../widget_main/widget_promo.dart';
import '../widget_main/widget_logout.dart';
import '../../widgets/widget_authentication.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String name;
  String imgUrl;

  void showBottomSheet(BuildContext context, String username, String imgUrl) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LogOut(username, imgUrl);
      },
    );
  }

  void printName() {
    auth.getUserName().then((value) {
      setState(() {
        name = value;
      });
    });
  }

  void printImgUrl() {
    auth.getimgUrl().then((value) {
      setState(() {
        imgUrl = value;
      });
    });
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AuthenticateWidget()));
  }

  AuthenticateWidgetState auth = AuthenticateWidgetState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Row(children: [
              // Icon Button to enter Login/SignIn page
              IconButton(
                  icon: Icon(Icons.account_box),
                  onPressed: () {

                    navigateToLoginPage(context);

                  }),
            ])
          ],
        ),

        //main body: 1) products 2)promo
        body: Container(
          child: Column(
            children: [
              Products(),
              RaisedButton(
                child: Text("test"),
                onPressed: () {
                  printName();
                  printImgUrl();
                  showBottomSheet(context, name, imgUrl);
                },
              )
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
