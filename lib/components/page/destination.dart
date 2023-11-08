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
  final Widget icon;

  static const defaults = [
    Destination(
      type: NavigationTab.home,
      textLabel: 'Home',
      icon: Icon(Icons.home),
    ),
    Destination(
      type: NavigationTab.schedule,
      textLabel: 'Schedule',
      icon: Icon(Icons.email),
    ),
    Destination(
      type: NavigationTab.calendar,
      textLabel: 'Calendar',
      icon: Icon(Icons.calendar_month),
    ),
    Destination(
      type: NavigationTab.profile,
      textLabel: 'Profile',
      icon: Icon(Icons.account_circle),
    ),
    Destination(
      type: NavigationTab.logout,
      textLabel: 'Log Out',
      icon: Icon(Icons.logout),
    ),
  ];
}
