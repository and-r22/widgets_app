import 'package:flutter/material.dart';

class MenuItem {

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

}

const appMenuItems = <MenuItem> [

  MenuItem(
    title: 'CounterScreen',
    subTitle: 'Introduccion a Riverpod',
    link: '/counter',
    icon: Icons.add
  ),

  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars y dialogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline
  ),
  
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),

  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter',
    link: '/ui_controls',
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: 'Tutorial',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/app_tutorial',
    icon: Icons.accessible_rounded
  ),

  MenuItem(
    title: 'Infinite Scroll + Pull to Refresh',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded
  ),

  MenuItem(
    title: 'Theme changer',
    subTitle: 'Cambiar tema de la app',
    link: '/theme_changer',
    icon: Icons.color_lens_outlined
  ),

];