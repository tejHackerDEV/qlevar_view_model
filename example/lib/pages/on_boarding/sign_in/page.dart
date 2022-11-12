import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../../routes/dashboard_routes.dart';
import '../../../routes/on_boarding_routes.dart';
import 'view_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  get viewModel => QVM.get<SignInViewModel>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(controller: viewModel.textEditingController),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => QR.navigator.replaceLast(OnBoardingRoutes.signup),
            child: const Text('Sign-Up'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () =>
                QR.navigator.replaceLastName(DashboardRoutes.dashboard),
            child: const Text('Dashboard'),
          ),
        ],
      ),
    );
  }
}
