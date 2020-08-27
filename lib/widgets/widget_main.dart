import 'package:globens_flutter_client/widgets/widget_search.dart';
import 'widget_businesspage.dart';
import 'widget_authentication.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '';

// region Main page root
/*class MyApp extends StatefulWidget {
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
}*/

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

        //main body: 1) products 2)promo
        body: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Icon Button to enter Login/SignIn page
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Search()),
                        );
                      }),
                ),
              ]),
              Products(),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

// endregion

// region Event handlers

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
        children: List.generate(9, (index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border.all()),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {},
              child: Text("product $index"),
            ),
          );
        }),
      ),
    );
  }
}

// region Promo part
class Promo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// endregion
