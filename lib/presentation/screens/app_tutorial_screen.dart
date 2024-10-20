import 'package:flutter/material.dart';

class AppTutorialScren extends StatelessWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _TutorialView(),
    );
  }
}

class _TutorialView extends StatelessWidget {
  const _TutorialView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
