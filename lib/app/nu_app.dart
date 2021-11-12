import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'routes/default_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        log('::${settings.name}');

        final routes = DefaultRoutes(
          context,
          settings: settings,
        ).getRoutes;
        final builder = routes[settings.name!];
        return MaterialPageRoute(builder: (context) => builder!(context));
      },
    );
  }
}
