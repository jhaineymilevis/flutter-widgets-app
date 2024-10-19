import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/menu/menu_item.dart';
import 'package:flutter_application_1/config/routes/app_route.dart';
import 'package:flutter_application_1/presentation/screens/buttons_screen.dart';
import 'package:flutter_application_1/presentation/screens/cards_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter + Material 3"),
        ),
        body: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      },
    ); // el builder significa que se va a construir en tiempo de ejecucion
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.pushNamed(context, menuItem.link);
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(),
          ),
        );*/
        context.push(menuItem.link);

        //context.pushNamed(CardsScreen.name)
      },
    );
  }
}
