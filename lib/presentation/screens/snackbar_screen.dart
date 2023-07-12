import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo!!!'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'Ok!', onPressed: ()=>{}),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: const _SnackbarView(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: ()=> showCustomSnackbar(context), 
      ),
    );
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, // evita cerrar la popup dando click por fuera del contexto (solo usando los botones)
      builder:(context) => AlertDialog(
        title: const Text('¿Estas Seguro ?'),
        content: const Text('A framework for building beautiful, natively compiled applications from a single codebase. Support is available for Material Design 3.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: ()=> {
              showAboutDialog(
                context: context, 
                children: [
                  const Text('A framework for building beautiful, natively compiled applications from a single codebase. Support is available for Material Design 3.')
                ]
              )
            },
            child: const Text('Licencias Usadas')
          ),
          FilledButton.tonal(
            onPressed: ()=> openDialog(context),
            child: const Text('Mostrar Dialogo Pantalla')
          ),
        ],
      ),
    );
  }
}