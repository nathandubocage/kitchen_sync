import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return GoogleFonts.dmSans(
            color: AppColors.primary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          );
        }
        return GoogleFonts.dmSans(
          color: AppColors.slateGray,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.primary, size: 24);
        }
        return const IconThemeData(color: AppColors.slateGray, size: 24);
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.primary.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primary.withValues(alpha: 0.04);
        }
        return null;
      }),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: CupertinoColors.activeBlue,
    ),
  );
}
