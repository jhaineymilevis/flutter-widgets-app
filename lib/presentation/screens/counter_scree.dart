import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/counter_provider.dart';
import 'package:flutter_application_1/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = "counter_screen";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final int clickCounter =
        ref.watch(conunterProvider); //watichn counter provider of riverpod
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Screen"),
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
        body: Center(
          child: Text("Valor: $clickCounter",
              style: Theme.of(context).textTheme.titleLarge),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //ref.read(conunterProvider.notifier).state++; // increment counter using riverpod
            ref
                .read(conunterProvider.notifier)
                .update((state) => state + 1); // another way to update state
          },
          child: const Icon(Icons.add),
        ));
  }
}
