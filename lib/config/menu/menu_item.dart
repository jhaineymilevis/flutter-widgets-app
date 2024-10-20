import 'package:flutter/material.dart';

class MenuItem {
  final String link;
  final String subTitle;
  final String title;
  final IconData icon;

  const MenuItem(
      {required this.link,
      required this.subTitle,
      required this.title,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicator',
      subTitle: 'Generale sy controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbar',
      subTitle: 'Snackbars y dialogos',
      link: '/snaks',
      icon: Icons.bar_chart_outlined),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Statefull widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'Ui controls',
      subTitle: 'Varios widgets',
      link: '/ui-controls',
      icon: Icons.format_align_center),
  MenuItem(
      title: 'Tutorial',
      subTitle: 'Tutotial introductorio',
      link: '/tutorial',
      icon: Icons.abc_rounded),
  MenuItem(
      title: 'Inifinite scroll',
      subTitle: 'Listas infniitas',
      link: '/scroll',
      icon: Icons.list_alt_rounded),
];
