import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_router_testing/routes/dashboard_routes.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../../routes/on_boarding_routes.dart';
import 'view_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  get viewModel => QVM.get<SignupViewModel>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(controller: viewModel.textEditingController),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () =>
                QR.navigator.replaceLastName(OnBoardingRoutes.signIn),
            child: const Text('Sign-In'),
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
