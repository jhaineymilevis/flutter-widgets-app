import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/app_route.dart';
import 'package:flutter_application_1/presentation/screens/buttons_screen.dart';
import 'package:flutter_application_1/presentation/screens/cards_screen.dart';
import 'package:flutter_application_1/presentation/screens/home_screen.dart';

import 'config/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 4).getTheme(),
      /*home: const HomeScreen(),
     routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },*/
    );
  }
}
