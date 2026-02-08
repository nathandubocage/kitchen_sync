import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_sync/ui/core/widgets/card_icon_widget.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';

class CardHeaderWidget extends StatelessWidget {
  const CardHeaderWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.items,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final int items;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        CardIconWidget(color: color, icon: icon),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold,
                  color: AppColors.mirage,
                  fontSize: 18,
                  height: 1.1,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.dmSans(
                  color: AppColors.slateGray,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Chip(
          label: Text('$items items'),
          color: WidgetStateColor.resolveWith(
            (states) => AppColors.catskillWhiteThree,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          side: BorderSide.none,
          labelStyle: GoogleFonts.dmSans(
            color: AppColors.slateGray,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
