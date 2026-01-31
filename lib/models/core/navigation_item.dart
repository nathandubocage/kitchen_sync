import 'package:flutter/material.dart';

class NavigationItem {
  const NavigationItem({
    required this.initialRoute,
    required this.label,
    required this.icon,
    this.selectedIcon,
  });

  final String initialRoute;
  final String label;
  final Widget icon;
  final Widget? selectedIcon;
}
