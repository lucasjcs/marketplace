import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

class Loading extends StatelessWidget {
  final Color color;
  final double? size;
  const Loading({this.color = AppColors.purple, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size ?? 40,
      width: this.size ?? 40,
      child: CircularProgressIndicator(
        color: this.color,
        strokeWidth: 1.5,
      ),
    );
  }
}
