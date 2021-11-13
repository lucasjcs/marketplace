import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final bool showAppBar;

  const DefaultScaffold({
    required this.body,
    this.showAppBar = false,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: AppColors.purple,
              toolbarHeight: 80,
              elevation: 0,
              title: this.title,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: body,
        ),
      ),
    );
  }
}
