import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:globens_flutter_client/entities/AppUser.dart';
import 'package:globens_flutter_client/utils/Locale.dart';
import 'package:globens_flutter_client/utils/Utils.dart';
import '../../utils/Utils.dart';
import 'ProductViewerScreen.dart';
import 'pages_tab/MyBusinessPagesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globens_tab/GlobensScreen.dart';
import 'menu_tab/MenuScreen.dart';

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

    // firebase dynamic links
    initDynamicLinks();

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
            label: Locale.get('Globens hub'),
            icon: Image.asset(
              'assets/placeholder_products.png',
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: Locale.get('My pages'),
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
            label: Locale.get('Menu'),
          ),
        ],
      ),
    );
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        var reg = RegExp(r'^(\/product_)(\d+)$');
        if (reg.hasMatch(deepLink.path)) {
          var productId = int.parse(reg.firstMatch(deepLink.path).group(2));
          var res = await grpcFetchProduct(productId);
          if (res.item1) {
            Navigator.pushNamed(context, ProductViewerScreen.route_name, arguments: res.item2);
          }
        }
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
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
      await toast(Locale.get("Please Sign In first!"));
    } else
      switchTab(selectedIndex);
  }
}
