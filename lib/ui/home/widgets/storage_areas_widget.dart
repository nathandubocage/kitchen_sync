import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kitchen_sync/ui/core/widgets/card_header_widget.dart';
import 'package:kitchen_sync/ui/core/widgets/card_wrapper_widget.dart';
import 'package:kitchen_sync/utils/color_helpers.dart';
import 'package:solar_icon_pack/solar_bold_icons.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';

import 'package:kitchen_sync/utils/widget_extensions.dart';

class StorageAreasWidget extends StatelessWidget {
  const StorageAreasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              'Storage Areas',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                color: AppColors.mirage,
                fontSize: 18,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 3,
              children: [
                Text(
                  'Manage',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                Icon(
                  SolarBoldIcons.settings,
                  color: AppColors.primary,
                  size: 14,
                ),
              ],
            ),
          ],
        ).withPadding(const EdgeInsets.symmetric(horizontal: 16)),
        const SizedBox(height: 16),
        CardWrapperWidget(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  SolarBoldIcons.snowflake,
                  size: 96,
                  color: AppColors.primary,
                ),
              ),
              Column(
                children: [
                  CardHeaderWidget(
                    color: AppColors.primary,
                    icon: SolarBoldIcons.snowflake,
                    title: 'Upper Fridge',
                    subtitle: '3°C • Optimal',
                    items: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CardWrapperWidget(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  SolarBoldIcons.fridge,
                  size: 96,
                  color: getColorFromStringHex("#155DFC"),
                ),
              ),
              Column(
                children: [
                  CardHeaderWidget(
                    color: getColorFromStringHex("#155DFC"),
                    icon: SolarBoldIcons.fridge,
                    title: 'Lower Freezer',
                    subtitle: '-18°C • Optimal',
                    items: 23,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CardWrapperWidget(
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  SolarBoldIcons.box,
                  size: 96,
                  color: getColorFromStringHex("#EA580C"),
                ),
              ),
              Column(
                children: [
                  CardHeaderWidget(
                    color: getColorFromStringHex("#EA580C"),
                    icon: SolarBoldIcons.box,
                    title: 'Pantry Shelves',
                    subtitle: 'Dry Storage',
                    items: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
