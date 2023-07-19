import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String link;
  final IconData icon;
  final String subTitle;

  const MenuItem({
    required this.title, 
    required this.link, 
    required this.icon, 
    required this.subTitle
  });
}

  const appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Botones', 
      subTitle: 'Varios botones en Flutter',
      link: '/buttons', 
      icon: Icons.smart_button_outlined, 
    ),

    MenuItem(
      title: 'Tarjetas', 
      subTitle: 'Contenedor estilizado',
      link: '/cards', 
      icon: Icons.credit_card, 
    ),

    MenuItem(
      title: 'ProgressIndicators', 
      subTitle: 'Generales y controlados',
      link: '/progress', 
      icon: Icons.refresh_rounded, 
    ),

    MenuItem(
      title: 'Progress Indicators', 
      subTitle: 'Generales y controlados',
      link: '/progress', 
      icon: Icons.refresh_rounded, 
    ),

    MenuItem(
      title: 'Snackbars y dialogos', 
      subTitle: 'Indicadores en pantalla',
      link: '/snackbar', 
      icon: Icons.info_outline, 
    ),

    MenuItem(
      title: 'Animated container', 
      subTitle: 'Stateful widget animado',
      link: '/animated', 
      icon: Icons.check_box_outline_blank_rounded, 
    ),

    MenuItem(
      title: 'UI Controls + Title', 
      subTitle: 'Una serie de controles de Flutter',
      link: '/uiControls', 
      icon: Icons.car_rental_outlined, 
    ),

    MenuItem(
      title: 'Introducción a la aplicación', 
      subTitle: 'Pequeño tutorial de la aplicación',
      link: '/tutorial', 
      icon: Icons.accessible_rounded, 
    ),

    MenuItem(
      title: 'InfinititeScroll y Pull', 
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infiniteScroll', 
      icon: Icons.list_alt_rounded, 
    ),
    MenuItem(
      title: 'Counter', 
      subTitle: 'Contador de clicks',
      link: '/counter', 
      icon: Icons.touch_app, 
    ),
  ];
