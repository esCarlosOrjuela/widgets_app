import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/menu_items.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Home'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTitle(menuItem: menuItem);

      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTitle({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      onTap: () {
        /* FORMA 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ButtonsScreen()),
        );*/

        // FORMA 2: 
        // Navigator.pushNamed(context, menuItem.link);

        // FORMA 3:
        context.push(menuItem.link);

        // FORMA 4:
        // context.pushNamed(RoutesScreenApp.home.toString());
      },
    );
  }
}