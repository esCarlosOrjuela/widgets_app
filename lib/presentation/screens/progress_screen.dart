import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Progress Indicators'),
        ),
        body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Progress indicator infinite'),
          SizedBox(height: 15),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45),
          SizedBox(height: 20),
          Text('Progress indicator controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){ // periodicamente, cada 300 milisegundos estara emitiendo un valor
        // que quiero hacer con este valor que se esta emitiendo
        return (value * 2)/ 100; // => valores desde 0.0, hasta 1.0
      }).takeWhile((value) => value < 1), // emitira valores siempre y cando value sea menor a 100
      builder: (context, valueGenerated) { // controlamos las acciones en cada emisiòn

        final progressValue = valueGenerated.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12
              ),
              const SizedBox(width: 20),
              Expanded( // Toma el espacio restante del control padre
                child: LinearProgressIndicator(
                  value: progressValue,
                )
              )
            ],
          ),
        );
      },
    );
  }
}