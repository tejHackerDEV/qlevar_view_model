import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../../../routes/dashboard_routes.dart';
import 'view_model.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);
  HomeFragmentViewModel get viewModel => QVM.get<HomeFragmentViewModel>()!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          viewModel.runtimeType.toString(),
          style: const TextStyle(fontSize: 25.0),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 50,
            separatorBuilder: (_, index) => const SizedBox(height: 8.0),
            itemBuilder: (_, index) => InkWell(
              onTap: () => QR.toName(DashboardRoutes.products, params: {
                ProductsParams.id: index,
              }),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: [
                      Text(
                        'I am product ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'My price is ${viewModel.priceByIndex(index)}',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
