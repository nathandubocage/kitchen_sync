import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_sync/ui/core/themes/colors.dart';

class CardStatisticWidget extends StatelessWidget {
  const CardStatisticWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.value,
    required this.label,
    this.onTap,
  });

  final Color color;
  final Widget icon;
  final String value;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: 140,
        height: 130,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: icon,
                ),
                const SizedBox(height: 12),
                Text(
                  value,
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mirage,
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.dmSans(
                    color: AppColors.slateGray,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
