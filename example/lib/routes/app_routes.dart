import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'dashboard_routes.dart';
import 'on_boarding_routes.dart';

class AppRoutes {
  static const String root = 'root';

  void setup() {
    QR.settings.initPage = const Center(
      child: FlutterLogo(),
    );
    if (kIsWeb) {
      QR.settings.pagesType = const QFadePage(
        transitionDurationMilliseconds: 500,
        withType: QSlidePage(
          transitionDurationMilliseconds: 1000,
          offset: Offset(0, 1),
        ), // set the type to mix with
      );
    }
  }

  final routes = <QRoute>[
    ...OnBoardingRoutes().routes,
    DashboardRoutes().routes,
  ];
}
