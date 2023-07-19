import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

import '../providers/theme_provider.dart';

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final int clickCounter = ref.watch(counterProvider); // ref.watch => Pendiente de los cambios de estado de counterProvider
    final bool isDarkMode = ref.watch(isDarkModeProvider); // ref.watch => Pendiente de los cambios de estado de isDarkModeProvider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: (isDarkMode) 
              ? const Icon(Icons.dark_mode_outlined) 
              : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
          
        )
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter', 
          style: textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++; //  => Notificamos al provider un cambio de estado.
          // Otra forma de hacerlo
          // ref.read(counterProvider.notifier).update((state) => (state + 1)); //  => Notificamos al provider un cambio de estado.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}