import 'package:qlevar_router/qlevar_router.dart';

import '../pages/dashboard/builder.dart';
import '../pages/dashboard/fragments/home/builder.dart';
import '../pages/dashboard/fragments/home/fragment.dart';
import '../pages/dashboard/fragments/profile/fragment.dart';
import '../pages/dashboard/page.dart';
import '../pages/dashboard/product/builder.dart';
import '../pages/dashboard/product/page.dart';

class ProductsParams {
  static const String id = 'id';
}

class DashboardRoutes {
  static const String dashboard = 'dashboard';
  static const String products = 'products';

  static List<String> tabs = [
    'home',
    'profile',
  ];

  final routes = QRoute.withChild(
    path: '/dashboard',
    name: dashboard,
    initRoute: '/home',
    middleware: [
      DashboardViewModelBuilder(),
    ],
    builderChild: (router) => DashboardPage(router: router),
    children: [
      QRoute(
        path: '/home',
        name: tabs[0],
        middleware: [
          HomeFragmentViewModelBuilder(),
        ],
        builder: () => const HomeFragment(),
      ),
      QRoute(
        path: '/profile',
        name: tabs[1],
        builder: () => const ProfileFragment(),
      ),
      QRoute(
        path: '/products/:${ProductsParams.id}',
        name: products,
        middleware: [
          ProductViewModelBuilder(),
        ],
        builder: () => const ProductPage(),
      ),
    ],
  );
}
