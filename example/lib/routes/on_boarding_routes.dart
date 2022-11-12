import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../pages/on_boarding/sign_in/page.dart';
import '../pages/on_boarding/sign_in/view_model.dart';
import '../pages/on_boarding/sign_up/page.dart';
import '../pages/on_boarding/sign_up/view_model.dart';

class OnBoardingRoutes {
  static const String signIn = 'sign-in';
  static const String signup = 'sign-up';

  final routes = [
    QRoute(
      path: '/sign-in',
      name: signIn,
      middleware: [
        QViewModelBuilder(() => SignInViewModel()),
      ],
      builder: () => const SignInPage(),
    ),
    QRoute(
      path: '/sign-up',
      name: signup,
      middleware: [
        QViewModelBuilder(() => SignupViewModel()),
      ],
      builder: () => const SignupPage(),
    ),
  ];
}
