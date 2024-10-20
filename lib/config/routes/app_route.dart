import 'package:flutter_application_1/presentation/screens/progress_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen()),
  GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => const CardsScreen()),
  GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => const ProgressScreen()),
  GoRoute(
      name: SnackbarScreen.name,
      path: '/snaks',
      builder: (context, state) => const SnackbarScreen()),
  GoRoute(
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context, state) => const AnimatedScreen()),
  GoRoute(
      name: UiControllScreen.name,
      path: '/ui-controls',
      builder: (context, state) => const UiControllScreen()),
  GoRoute(
      name: AppTutorialScren.name,
      path: '/tutorial',
      builder: (context, state) => const AppTutorialScren()),
]);
