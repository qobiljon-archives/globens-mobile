import 'package:globens_flutter_client/widgets/home screen.dart';
import 'package:globens_flutter_client/widgets/business page screen.dart';
import 'package:globens_flutter_client/widgets/settings screen.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootTabsScreen extends StatefulWidget {
  RootTabsScreen({Key key}) : super(key: key);

  @override
  _RootTabsScreenState createState() => _RootTabsScreenState();
}

class _RootTabsScreenState extends State<RootTabsScreen> {
  int _selectedIndex = 0;
  static List<Widget> _tabWidgets = <Widget>[HomeScreen(), BusinessPageScreen(), SettingsScreen()];

  void _onTabSelected(int selectedIndex) {
    setState(() {
      if (selectedIndex == 1 && !AppUser.isAuthenticated()) {
        _selectedIndex = 2;
        Fluttertoast.showToast(msg: "Please Sign In first!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
      } else
        _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
