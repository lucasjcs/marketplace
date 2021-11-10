import 'package:flutter/material.dart';
import '../ui/pages/pages.dart';

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
