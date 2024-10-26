import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/routes/app_route.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //final isDarkMode = ref.watch(isDarkModeProvider);
    //final selectedColor = ref.watch(selectedColorProvider);
    final appTheme = ref.watch(themeNorifierProvider);
    return MaterialApp.router(
      title: 'Flutter widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
      theme: appTheme.getTheme(),
      /*home: const HomeScreen(),
     routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen(),
      },*/
    );
  }
}
