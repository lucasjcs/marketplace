import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';
import 'package:marketplace_nuconta/app/ui/styles/styles.dart';

class NuText extends StatelessWidget {
  final String text;
  final bool bold;
  final double size;
  final Color color;
  final bool center;
  final int? maxLines;

  const NuText({
    required this.text,
    this.bold = false,
    this.size = AppFontSize.standard,
    this.color = AppColors.textDark,
    this.center = false,
    this.maxLines = 999999,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: center ? TextAlign.center : null,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
