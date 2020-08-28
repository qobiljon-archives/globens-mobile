import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void _onSearchPressed() {
    // todo search functionality
  }

  @override
  Widget build(BuildContext context) {
    AppUser.init();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  padding: null,
                  child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: _onSearchPressed
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
