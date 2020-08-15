import 'package:globens_flutter_client/widgets/widget_authentication.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
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
            title: Text(
              "Globens",
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Icon Button to enter Login/SignIn page
                IconButton(icon: Icon(Icons.search), onPressed: _searchPage),
                IconButton(
                    icon: Icon(Icons.account_box), onPressed: _profileClick),
              ])
            ]),

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
      showModalBottomSheet(
          context: context,
          builder: (context) => AppUser.getProfileViewContainer(context));
    else
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AuthenticateWidget()));
  }

  void _searchPage() {
    // showModalBottomSheet(context: context, builder: (context) => Search());
    showMaterialModalBottomSheet(
        context: context,
        expand: true,
        duration: const Duration(milliseconds: 100),
        builder: (context, scrollController) => Search());
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

// endregion
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: FloatingSearchBar.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return null;
        },
        trailing: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {

          },
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        onChanged: (String value) {
          print("Hi");
        },
        onTap: () {},

        decoration: InputDecoration.collapsed(
          hintText: "Search a product",


        ),
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
