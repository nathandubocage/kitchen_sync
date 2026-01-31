import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget withPadding(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }
}
