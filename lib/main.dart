import 'package:flutter/material.dart';
import 'config/Navigator/app_router.dart';
import 'config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
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
