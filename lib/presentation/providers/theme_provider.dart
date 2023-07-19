import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorIdProvider = StateProvider<int>((ref) => 6);

/// Listado de colores inmutable
final colorThemeProvider = Provider<List<Color>>((ref) => listColorsForTheme);