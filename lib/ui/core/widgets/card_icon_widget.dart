import 'package:flutter/material.dart';

class CardIconWidget extends StatelessWidget {
  const CardIconWidget({
    super.key,
    required this.icon,
    required this.color,
    this.width = 48,
    this.height = 48,
    this.borderRadius = 16,
  });

  final IconData icon;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
