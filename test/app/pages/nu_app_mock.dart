import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NuAppMock extends StatelessWidget {
  final Widget widget;

  const NuAppMock({required this.widget});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget,
    );
  }
}
