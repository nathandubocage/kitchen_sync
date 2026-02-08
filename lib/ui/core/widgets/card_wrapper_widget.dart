import 'package:flutter/material.dart';
import 'package:kitchen_sync/ui/core/themes/colors.dart';
import 'package:kitchen_sync/utils/widget_extensions.dart'; //

class CardWrapperWidget extends StatelessWidget {
  const CardWrapperWidget({
    super.key,
    required this.child,
    this.borderRadius = 24.0,
    this.height = 180,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = AppColors.white,
  });

  final Widget child;
  final double borderRadius;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: AppColors.catskillWhite.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mirage.withValues(alpha: 0.05),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.10),
            blurRadius: 3,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    ).withPadding(const EdgeInsets.symmetric(horizontal: 16));
  }
}
