import 'package:globens_flutter_client/widgets/globens screen.dart';
import 'package:globens_flutter_client/widgets/my business pages screen.dart';
import 'package:globens_flutter_client/widgets/menu screen.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootTabsScreen extends StatefulWidget {
  RootTabsScreen({Key key}) : super(key: key);

  @override
  _RootTabsScreenState createState() => _RootTabsScreenState();
}

class _RootTabsScreenState extends State<RootTabsScreen> {
  int _selectedIndex = 0;
  static List<Widget> _tabWidgets = <Widget>[GlobensScreen(), MyBusinessPagesScreen(), MenuScreen()];



  @override
  void initState() {
    super.initState();
    AppUser.init().then((value) => setState(() {}));
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
            title: Text('Globens'),
            icon: Image.asset(
              'assets/icon.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            title: Text('My pages'),
            icon: AppUser.isAuthenticated()
                ? CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(AppUser.profileImageUrl),
                  )
                : Icon(Icons.outlined_flag),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
        ],
      ),
    );
  }

  void _onTabSelected(int selectedIndex) {
    if (selectedIndex == 1 && !AppUser.isAuthenticated()) {
      setState(() {
        _selectedIndex = 2;
      });

      toast("Please Sign In first!");
    } else
      setState(() {
        _selectedIndex = selectedIndex;
      });
  }
}
