import 'package:globens_flutter_client/widgets/widget_authentication.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// region Main page root
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

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // region Override
  @override
  Widget build(BuildContext context) {
    AppUser.init();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Row(children: [
              // Icon Button to enter Login/SignIn page
              IconButton(icon: Icon(Icons.account_box), onPressed: _profileClick),
            ])
          ],
        ),

        //main body: 1) products 2)promo
        body: Container(
          child: Column(
            children: [
              Products(),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  // endregion

  // region Event handlers

  void _profileClick() {
    if (AppUser.isAuthenticated())
      showModalBottomSheet(context: context, builder: (context) => AppUser.getProfileViewContainer(context));
    else
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthenticateWidget()));
  }

  // endregion
}
// endregion

// region Products part
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all()),
      child: GridView.count(
        childAspectRatio: 3,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: List.generate(5, (index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border.all()),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {},
              child: Text("buttonn $index"),
            ),
          );
        }),
      ),
    );
  }
}
// endregion

// region Promo part
class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// endregion
