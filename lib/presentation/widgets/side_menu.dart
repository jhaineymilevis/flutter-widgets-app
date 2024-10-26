import 'dart:io';

import 'package:flutter/material.dart';

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
              child: Text("Opciones principales")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.add), label: Text("Home screen")),
          const NavigationDrawerDestination(
              icon: Icon(Icons.add_shopping_cart_rounded),
              label: Text("Otra pantalla")),
        ]);
  }
}
