import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildSearchBar(),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: searchText,
      decoration: InputDecoration(),
      onChanged: (text) {},
      onSubmitted: (text) {},
      onEditingComplete: () {},
    );
  }
}
