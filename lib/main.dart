import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/Navigator/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope( /// => flutter_riverpod (son parte de un patrón de manejo de estado)
    /*
    //En resumen, un Provider es una solución que hace más fácil manejar 
    //el estado de una aplicación Flutter de una manera eficiente y manejable. 
    */
      child: MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //home: const HomeScreen(),
      title: 'Flutter Widgets',
      routerConfig: appRouter, // integramos goRouter => config/navigator/app_router 
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getThemeApp(),
    );
  }
}
