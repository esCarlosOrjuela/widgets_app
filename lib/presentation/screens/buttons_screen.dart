import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/Widgets/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Buttons'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed:() {
          context.pop(); // retorna a la pagina anterior
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(onPressed: ()=> {}, child: const Text('Elevated Button')),
          const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
          ElevatedButton.icon(
            onPressed: () => {}, 
            label: const Text('Elevated Icon'),
            icon: const Icon(Icons.access_alarm_rounded), 
          ),
          FilledButton(onPressed: () => {}, child: const Text('Filled')),
          FilledButton.icon(
            onPressed: () => {},
            label: const Text('Filled Icon'), 
            icon: const Icon(Icons.accessibility_new), 
          ),
          OutlinedButton(onPressed: () => {}, child: const Text('Outlined')),
          OutlinedButton.icon(
            onPressed: () => {}, 
            label: const Text('Outlined Icon'),
            icon: const Icon(Icons.terminal), 
          ),
          TextButton(onPressed: () => {}, child: const Text('Text')),
          TextButton.icon(
            onPressed: () => {}, 
            label: const Text('Text Icon'),
            icon: const Icon(Icons.account_box_outlined), 
          ),
          IconButton(onPressed: ()=> {}, icon: const Icon(Icons.app_registration_rounded)),
          IconButton(
            onPressed: ()=> {}, 
            icon: const Icon(Icons.app_registration_rounded),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
              iconColor: const MaterialStatePropertyAll(Colors.white),
            ),
          ),
          const CustomButton()

        ],
      ),
    );
  }
}