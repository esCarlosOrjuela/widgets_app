import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/app_theme.dart';

/// StateProvider => Notificar el cambio de estado de una propiedad
final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorIdProvider = StateProvider<int>((ref) => 6);

/// Provider => Notificar el estado de una propiedad inmutable: Que no puede ser cambiada o alterada.
final colorThemeProvider = Provider<List<Color>>((ref) => listColorsForTheme);



// Objeto de tipo AppTheme (Custom)

// StateNotifierProvider => Crea un notificador de estado y expresando el estado actual de un objeto
// ThemeControllerNotifier => Controlador de notificaciones de estado
// AppTheme => Clase sobre la cual se supervisa algun cambio de estado
final themeNotifierProvider = StateNotifierProvider<ThemeControllerNotifier, AppTheme>((ref) => ThemeControllerNotifier());

/// ThemeControllerNotifier => Controlador que notifica cuando AppTheme tenga un cambio de estado
class ThemeControllerNotifier extends StateNotifier<AppTheme> {
  // Constructor
  // STATE = Estado => new AppTheme();
  ThemeControllerNotifier(): super(AppTheme()); /// Asignamos al controlador el estado de arranque de AppTheme
  
  // Ya con esto, podemos tener en nuestro ThemeControllerNotifier, un State de la clase AppTheme():

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}