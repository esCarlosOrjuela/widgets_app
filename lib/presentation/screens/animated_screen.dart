import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50.0;
  double height = 50.0;
  Color color = Colors.indigo;
  double borderRadius = 10.0;


  void changeShape(){
    final random = Random();

    width = random.nextInt(300) + 120; // => nuemto aleatorio. Entre: Min 50 y Max 300
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;
    color = Color.fromRGBO(
      random.nextInt(255), // red (0-255)
      random.nextInt(255), // green (0-255)
      random.nextInt(255), // blue (0-255)
      1 // opacity
    );
        

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: (width <= 0) ? 0: width,
          height: (height <= 0) ? 0: height,
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular((borderRadius <= 0) ? 0 : borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}