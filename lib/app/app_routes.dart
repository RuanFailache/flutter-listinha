import 'package:flutter/material.dart';
import 'package:listinha/features/features.dart';

abstract class AppRoute {
  String get path;

  Widget screen(BuildContext context);
}

class AppRoutes {
  String get initialRoute {
    final route = HomeRoute();
    return route.path;
  }

  Map<String, Widget Function(BuildContext)> get routes => {
        for (AppRoute route in _routes) route.path: route.screen,
      };

  List<AppRoute> get _routes => [
        HomeRoute(),
      ];
}
