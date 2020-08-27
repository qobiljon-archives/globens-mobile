import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool visibility;
  final List items = ["1", "2", "3", "4"];

  void search() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: FloatingSearchBar.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${items[index]}'),
              );
            },
          );
        },
        trailing: visibility
            ? IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
            : Container(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        onChanged: (String value) {
          setState(() {
            if (value.length > 0)
              visibility = true;
            else
              visibility = false;
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
