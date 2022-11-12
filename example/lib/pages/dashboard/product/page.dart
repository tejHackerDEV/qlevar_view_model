import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../../routes/dashboard_routes.dart';
import '../fragments/home/view_model.dart';
import '../view_model.dart';
import 'view_model.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);
  ProductViewModel get viewModel => QVM.get<ProductViewModel>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => QR.toName(DashboardRoutes.products, params: {
              ProductsParams.id: viewModel.getNextRandomProduct,
            }),
            child:
                Text('Navigate to ${viewModel.getNextRandomProduct} product'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => QR.navigator
                .replaceAllWithName(DashboardRoutes.products, params: {
              ProductsParams.id: 0,
            }),
            child: const Text('Replace all till 0 product'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final dashboardViewModel = QVM.get<DashboardViewModel>();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(dashboardViewModel != null
                    ? 'DashboardViewModel present in the memory'
                    : 'DashboardViewModel doesn\'t present in the memory'),
              ));
            },
            child: const Text('Check for DashboardViewModel'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final homeFragmentViewModel = QVM.get<HomeFragmentViewModel>();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(homeFragmentViewModel != null
                    ? 'HomeViewModel present in the memory'
                    : 'HomeViewModel doesn\'t present in the memory'),
              ));
            },
            child: const Text('Check for HomeFragmentViewModel'),
          ),
        ],
      ),
    );
  }
}
