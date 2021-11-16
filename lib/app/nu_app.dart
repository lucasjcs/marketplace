import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/routes/get_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      getPages: GetRoutes().routes,
    );
  }
}
