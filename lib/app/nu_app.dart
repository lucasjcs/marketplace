import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/routes/default_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketplace Nuconta',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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
