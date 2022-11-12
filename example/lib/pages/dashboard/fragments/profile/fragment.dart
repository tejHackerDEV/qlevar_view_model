import 'package:flutter/material.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../view_model.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({Key? key}) : super(key: key);
  get viewModel => QVM.get<DashboardViewModel>()!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(viewModel.runtimeType.toString()),
    );
  }
}
