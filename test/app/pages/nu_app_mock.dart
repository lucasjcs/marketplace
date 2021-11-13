import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NuAppMock extends StatelessWidget {
  final Widget widget;
  final List<GetPage<dynamic>>? routes;

  const NuAppMock({required this.widget, this.routes});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: widget,
      getPages: routes == null ? [] : routes!,
    );
  }
}
