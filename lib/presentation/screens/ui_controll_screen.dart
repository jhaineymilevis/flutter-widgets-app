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
  bool wnatsBrakfast = false;
  bool wantsLuchs = false;
  bool wantsDinner = false;

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
        ExpansionTile(
          title: const Text("Vehiculo de transporte"),
          subtitle: Text('$selectedTrnasportation'),
          children: [
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
        ),
        CheckboxListTile(
            title: const Text("Desayuno?"),
            value: wnatsBrakfast,
            onChanged: (value) => setState(() {
                  wnatsBrakfast = !wnatsBrakfast;
                })),
        CheckboxListTile(
            title: const Text("Almuerzo?"),
            value: wantsLuchs,
            onChanged: (value) => setState(() {
                  wantsLuchs = !wantsLuchs;
                })),
        CheckboxListTile(
            title: const Text("Cena?"),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
