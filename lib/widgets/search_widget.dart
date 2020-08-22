import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool visibility = true;

  void search() {}

  void isVisible() {
    setState(() {
      visibility = !visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: FloatingSearchBar.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return null;
        },
        trailing: visibility
            ? IconButton(
                icon: Icon(Icons.backspace),
                onPressed: () {},
              )
            : FlatButton(
                child: Text("v"),
                onPressed: () {},
              ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        onChanged: (String value) {
          setState(() {


          });
        },
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search a product",
        ),
      ),
    );

    //endregion
  }
}
