import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_sync/ui/core/themes/colors.dart';

extension WidgetExtensions on Widget {
  Widget withPadding(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }
}

extension TextExtensions on Text {
  Text withPrimaryTitle() {
    return Text(
      data!,
      style: GoogleFonts.dmSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.6,
        color: AppColors.mirage,
      ),
    );
  }
}
