import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRoutes = AppRoutes();
    appRoutes.setup();
    final routerDelegate = QRouterDelegate(
      appRoutes.routes,
      initPath: '/sign-in',
    );
    return MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: routerDelegate,
      theme: ThemeData.dark(),
    );
  }
}
