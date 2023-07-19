import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndezSelected = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 25; //=> indica el padding existente en la parte superior de la pantalla para identificar el notch
    /*
    if(Platform.isAndroid){
      print('Android $hasNotch');
    }
    else{
      print('iOS $hasNotch');
    }
    */
    return NavigationDrawer(
      selectedIndex: navDrawerIndezSelected,
      onDestinationSelected: (index) {
        setState(() {
          navDrawerIndezSelected = index;
        });

        final menuItemSelected = appMenuItems[navDrawerIndezSelected];
        context.push(menuItemSelected.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(27, hasNotch ? 0: 27, 16, 10),
          child: const Text('Bienvenido Carlos Orjuela')
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(27, 20, 16, 10),
          child: Text('Main')
        ),
        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(), /// Widget que crea una linea
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(27, 20, 16, 10),
          child: Text('More options')
        ),
        ...appMenuItems
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          )
        ),
      ],
    );
  }
}