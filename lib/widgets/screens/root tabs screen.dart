import 'package:globens_flutter_client/widgets/screens/my_pages/my%20business%20pages%20screen.dart';
import 'package:globens_flutter_client/widgets/screens/menu/menu%20screen.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globens/globens screen.dart';

class RootTabsScreen extends StatefulWidget {
  RootTabsScreen({Key key}) : super(key: key);

  @override
  _RootTabsScreenState createState() => _RootTabsScreenState();
}

class _RootTabsScreenState extends State<RootTabsScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  static List<Widget> _tabWidgets = <Widget>[GlobensScreen(), MyBusinessPagesScreen(), MenuScreen()];

  @override
  void initState() {
    super.initState();

    if (!AppUser.initialized)
      AppUser.init().then((_) {
        Navigator.of(context).pushReplacementNamed('/');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 242, 245, 1),
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
            label: 'Globens',
            icon: Image.asset(
              'assets/icon.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My business pages',
            icon: Icon(Icons.corporate_fare_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'App menu',
          ),
        ],
      ),
    );
  }

  void switchTab(int index) {
    if (index < 3)
      setState(() {
        _selectedIndex = index;
      });
  }

  void _onTabSelected(int selectedIndex) async {
    if (selectedIndex == 1 && !AppUser.isAuthenticated()) {
      switchTab(2);
      await toast("Please Sign In first!");
    } else
      switchTab(selectedIndex);
  }
}
