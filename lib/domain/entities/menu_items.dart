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

  static const appMenuItems = <MenuItem>[
    MenuItem(
      title: 'Botones', 
      subTitle: 'Varios botones en Flutter',
      link: '/buttons', 
      icon: Icons.smart_button_outlined, 
    ),
    MenuItem(
      title: 'Tarjetas', 
      subTitle: 'Contenedor estilizado',
      link: '/card', 
      icon: Icons.credit_card, 
    ),
  ];

}