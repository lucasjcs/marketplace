import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final bool showAppBar;
  final bool safeArea;
  final Color? backgroundColor;

  const DefaultScaffold({
    required this.body,
    this.title,
    this.showAppBar = false,
    this.safeArea = true,
    this.backgroundColor = AppColors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: AppColors.purple,
              toolbarHeight: 80,
              elevation: 0,
              title: this.title,
            )
          : null,
      body: safeArea
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: body,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(25),
              child: body,
            ),
    );
  }
}
