import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';
import 'package:kitchen_sync/utils/widget_extensions.dart';
import 'package:solar_icon_pack/solar_bold_icons.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Text('KitchenSync').withPrimaryTitle(),
            Text(
              'Welcome back, Nathan',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.slateGray,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppColors.catskillWhiteThree,
                padding: const EdgeInsets.all(12),
                shape: const CircleBorder(),
              ),
              icon: const Icon(
                SolarBoldIcons.sun,
                size: 20,
                color: AppColors.mirage,
              ),
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.primary.withValues(alpha: 0.8),
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?u=nathan',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
