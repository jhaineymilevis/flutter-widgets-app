import 'package:flutter/material.dart';

class UiControllScreen extends StatelessWidget {
  static const name = 'ui_controll_screen';
  const UiControllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controll Screen'),
      ),
      body: _UiControllView(),
    );
  }
}

class _UiControllView extends StatefulWidget {
  const _UiControllView({
    super.key,
  });

  @override
  State<_UiControllView> createState() => _UiControllViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControllViewState extends State<_UiControllView> {
  bool isDeveloper = true;
  Transportation selectedTrnasportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
          title: const Text('Developed mode'),
          subtitle: const Text('Constroels adicionales'),
        ),
        RadioListTile(
            title: const Text('By car'),
            value: Transportation.car,
            groupValue: selectedTrnasportation,
            onChanged: (value) => setState(() {
                  selectedTrnasportation = Transportation.car;
                })),
        RadioListTile(
            title: const Text('By plane'),
            value: Transportation.plane,
            groupValue: selectedTrnasportation,
            onChanged: (value) => setState(() {
                  selectedTrnasportation = Transportation.plane;
                })),
        RadioListTile(
            title: const Text('By boat'),
            value: Transportation.boat,
            groupValue: selectedTrnasportation,
            onChanged: (value) => setState(() {
                  selectedTrnasportation = Transportation.boat;
                })),
        RadioListTile(
            title: const Text('By submarine'),
            value: Transportation.submarine,
            groupValue: selectedTrnasportation,
            onChanged: (value) => setState(() {
                  selectedTrnasportation = Transportation.submarine;
                })),
      ],
    );
  }
}
