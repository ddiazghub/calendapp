import 'package:flutter/material.dart';
import 'package:scheduler_app/routes.dart';

class Destination {
  const Destination({
    required this.type,
    required this.textLabel,
    required this.icon,
  });

  // The current navigation page.
  final NavigationTab type;

  // The localized text label for the inbox.
  final String textLabel;

  // The icon that appears next to the text label for the inbox.
  final IconData icon;

  static const defaults = [
    Destination(
      type: NavigationTab.home,
      textLabel: 'Inicio',
      icon: Icons.home,
    ),
    Destination(
      type: NavigationTab.schedule,
      textLabel: 'Agendar',
      icon: Icons.edit_calendar,
    ),
    Destination(
      type: NavigationTab.calendar,
      textLabel: 'Calendario',
      icon: Icons.calendar_month,
    ),
    Destination(
      type: NavigationTab.profile,
      textLabel: 'Perfil',
      icon: Icons.account_circle,
    ),
    Destination(
      type: NavigationTab.logout,
      textLabel: 'Cerrar sesión',
      icon: Icons.logout,
    ),
  ];
}
