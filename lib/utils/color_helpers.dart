import 'package:flutter/material.dart';

Color getColorFromStringHex(String hexColor) {
  try {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  } catch (error) {
    return Colors.black;
  }
}

Color getColorFromStringRGB(String colorString) {
  try {
    final parts = colorString
        .split(',')
        .map((s) => int.parse(s.trim()))
        .toList();
    return Color.fromRGBO(parts[0], parts[1], parts[2], 1.0);
  } catch (error) {
    return Colors.black;
  }
}
