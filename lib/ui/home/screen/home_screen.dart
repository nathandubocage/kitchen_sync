import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icon_pack/solar_bold_icons.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';

import 'package:kitchen_sync/ui/home/view_model/home_view_model.dart';

import 'package:kitchen_sync/ui/core/widgets/header_widget.dart';
import 'package:kitchen_sync/ui/home/widgets/card_statistic_widget.dart';

import 'package:kitchen_sync/utils/widget_extensions.dart';

import 'package:kitchen_sync/utils/color_helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required HomeViewModel homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderWidget().withPadding(
                EdgeInsets.symmetric(horizontal: 16),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: [
                    const SizedBox(),
                    CardStatisticWidget(
                      color: getColorFromStringHex('#10B981'),
                      icon: Icon(
                        SolarBoldIcons.leaf,
                        color: getColorFromStringHex('#10B981'),
                      ),
                      value: '85%',
                      label: 'Fresh Score',
                    ),
                    CardStatisticWidget(
                      color: getColorFromStringHex('#EA580C'),
                      icon: Icon(
                        SolarBoldIcons.bell,
                        color: getColorFromStringHex('#EA580C'),
                      ),
                      value: '3',
                      label: 'Expiring Soon',
                    ),
                    CardStatisticWidget(
                      color: getColorFromStringHex('#155DFC'),
                      icon: Icon(
                        SolarBoldIcons.cartLarge2,
                        color: getColorFromStringHex('#155DFC'),
                      ),
                      value: '12',
                      label: 'To Buy',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
    );
  }
}
