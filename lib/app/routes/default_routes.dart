import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/pages/home/home_page.dart';

import 'app_routes.dart';

class DefaultRoutes {
  DefaultRoutes(
    this.context, {
    this.settings,
  });

  BuildContext context;
  final RouteSettings? settings;

  Map<String, WidgetBuilder> get getRoutes {
    return {
      AppRoutes.homePage: (_) => const HomePage(),
    };
  }
}
