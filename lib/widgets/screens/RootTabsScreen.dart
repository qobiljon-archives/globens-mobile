import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globens/GlobensScreen.dart';
import 'menu/MenuScreen.dart';
import 'pages/MyBusinessPagesScreen.dart';

class RootTabsScreen extends StatefulWidget {
  static String  route_name = '/';
  RootTabsScreen({Key key}) : super(key: key);

  @override
  _RootTabsScreenState createState() => _RootTabsScreenState();
}

class _RootTabsScreenState extends State<RootTabsScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  static List<Widget> _tabWidgets = <Widget>[GlobensScreen(), MyBusinessPagesScreen(), MenuScreen()];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!AppUser.initialized) AppUser.init();
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
            label: 'My pages',
            icon: Image.asset(
              'assets/business_page.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/menu.png',
              width: 25,
            ),
            label: 'Menu',
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
