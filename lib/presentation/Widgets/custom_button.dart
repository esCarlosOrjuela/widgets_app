import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
final colors = Theme.of(context).colorScheme;

    return ClipRRect( // permite integrar bordes redondos
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell( // Permite agregar un evento a mi Widget con efectos de button
          onTap: () => {},
          child: Padding(
            child: Text('Custom Button', style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }
}