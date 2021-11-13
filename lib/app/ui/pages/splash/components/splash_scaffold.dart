import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

class SplashScaffold extends StatelessWidget {
  final Widget child;
  const SplashScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.purple,
        ),
        child: SafeArea(child: child),
      ),
    );
  }
}
