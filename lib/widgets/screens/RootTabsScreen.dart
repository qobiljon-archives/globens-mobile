import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'pages/MyBusinessPagesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globens/GlobensScreen.dart';
import 'menu/MenuScreen.dart';

class RootTabsScreen extends StatefulWidget {
  static const String route_name = '/';

  RootTabsScreen({Key key}) : super(key: key);

  @override
  RootTabsScreenState createState() => RootTabsScreenState();
}

class RootTabsScreenState extends State<RootTabsScreen> with WidgetsBindingObserver {
  static const int GLOBENS_TAB = 0;
  static const int MY_PAGES_TAB = 1;
  static const int MENU_TAB = 2;
  int _selectedIndex;
  List<Widget> _tabWidgets;

  @override
  void initState() {
    super.initState();

    if (!AppUser.initialized) {
      AppUser.init();
    }

    _selectedIndex = GLOBENS_TAB;
    _tabWidgets = <Widget>[GlobensScreen(this), MyBusinessPagesScreen(this), MenuScreen(this)];
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
              'assets/globens_icon.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My pages',
            icon: Image.asset(
              'assets/tab_business_page.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/tab_menu.png',
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
