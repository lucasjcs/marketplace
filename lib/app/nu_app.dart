import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './ui/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
