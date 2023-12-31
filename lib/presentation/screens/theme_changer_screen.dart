import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: (isDarkMode) 
              ? const Icon(Icons.dark_mode_outlined) 
              : const Icon(Icons.light_mode_outlined),
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colorsThemeProvider = ref.watch(colorThemeProvider);
    final int colorIdProvider = ref.watch(themeNotifierProvider).selectedColor;
    
    return ListView.builder(
      itemCount: colorsThemeProvider.length,
      itemBuilder: (context, index) {
        final color = colorsThemeProvider[index];
        return RadioListTile(
          title: Text('Seleccionar este color', style: TextStyle(color: color)),
          subtitle: Text(color.colorName),
          activeColor: color,
          value: index, 
          groupValue: colorIdProvider,
          onChanged: (colorIdSelected) {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(colorIdSelected!);
          }, 
          
        );
      },
    );
  }
}