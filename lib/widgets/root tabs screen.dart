import 'package:globens_flutter_client/widgets/globens screen.dart';
import 'package:globens_flutter_client/widgets/my pages screen.dart';
import 'package:globens_flutter_client/widgets/menu screen.dart';
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
  static List<Widget> _tabWidgets = <Widget>[GlobensScreen(), PagesScreen(), MenuScreen()];

  void _onTabSelected(int selectedIndex) {
    if (selectedIndex == 1 && !AppUser.isAuthenticated()) {
      setState(() {
        _selectedIndex = 2;
      });
      Fluttertoast.showToast(msg: "Please Sign In first!", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.grey, textColor: Colors.white, fontSize: 16.0);
    } else
      setState(() {
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
}
