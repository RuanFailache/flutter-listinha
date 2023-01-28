import 'package:flutter/material.dart';

import 'app.dart';

class AppWidget extends StatelessWidget {
  final AppTheme _appTheme;
  final AppRoutes _appRoutes;

  const AppWidget({
    super.key,
    required AppTheme appTheme,
    required AppRoutes appRoutes,
  })  : _appTheme = appTheme,
        _appRoutes = appRoutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listinha',
      theme: _appTheme.theme,
      routes: _appRoutes.routes,
      initialRoute: _appRoutes.initialRoute,
    );
  }
}
