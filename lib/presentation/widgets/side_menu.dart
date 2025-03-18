import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  const SideMenu({
    required this.scaffoldKey, 
    super.key
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    // if (Platform.isAndroid) {
    //   print('Android $hasNotch');
    // }
    // if (Platform.isIOS) {
    //   print('Android $hasNotch');
    // }

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 5 : 20, 16, 10),
          child: const Text('Menu'),
        ),

        ...appMenuItems
          .sublist(0, 3)
          .map((item) => NavigationDrawerDestination (
            icon: Icon(item.icon), 
            label: Text(item.title),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
        ),

        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination (
            icon: Icon(item.icon), 
            label: Text(item.title),
          ),
        ),

      ]
    );
  }
}