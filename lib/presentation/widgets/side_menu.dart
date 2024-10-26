import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
        },
        selectedIndex: navDrawerIndex,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
              child: const Text("Opciones principales")),
          ...appMenuItems.sublist(0, 3).map(
                (e) => NavigationDrawerDestination(
                    icon: Icon(e.icon), label: Text(e.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
              child: const Text("Opciones secundarias")),
          ...appMenuItems.sublist(4, 7).map(
                (e) => NavigationDrawerDestination(
                    icon: Icon(e.icon), label: Text(e.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),
        ]);
  }
}
