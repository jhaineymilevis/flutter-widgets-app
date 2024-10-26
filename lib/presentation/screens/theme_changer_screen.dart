import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change theme"),
        actions: [
          IconButton(
            onPressed: () {
              //ref.read(conunterProvider.notifier).reset(); // reset counter using riverpod
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((state) => !state); // another way to reset state
            },
            icon: Icon(isDarkMode
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: const _TheneChangerVIew(),
    );
  }
}

class _TheneChangerVIew extends ConsumerWidget {
  const _TheneChangerVIew({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            "Este color: ",
            style: TextStyle(color: color),
          ),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index,
          groupValue: 0,
          onChanged: (value) {
            //todo notiifcar el cmabio
          },
        );
      },
    );
  }
}
