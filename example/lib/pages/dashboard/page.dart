import 'package:flutter/material.dart' hide AppBar;
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../routes/dashboard_routes.dart';
import '../../widgets/animated_app_bar.dart' as animated_app_bar;
import 'view_model.dart';

class DashboardPage extends StatefulWidget {
  final QRouter router;
  const DashboardPage({Key? key, required this.router}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  DashboardViewModel get viewModel => QVM.get<DashboardViewModel>()!;

  /// Used the differentiate whether user is moving in bottomNavigation tabs
  bool isMovingInBottomNavigation = true;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  @override
  void initState() {
    super.initState();
    widget.router.navigator.addListener(_updateNavigation);
    Future(_updateNavigation);
  }

  @override
  void dispose() {
    widget.router.navigator.removeListener(_updateNavigation);
    super.dispose();
  }

  void _updateNavigation() {
    if (mounted) {
      isMovingInBottomNavigation = false;
      for (final element in DashboardRoutes.tabs) {
        if (QR.currentPath.endsWith(element)) {
          isMovingInBottomNavigation = true;
          break;
        }
      }
      if (isMovingInBottomNavigation) {
        _animationController.reverse();
        final indexToNavigate = DashboardRoutes.tabs.indexWhere(
          (element) => element == widget.router.routeName,
        );
        debugPrint(
          'Previous Index Tab => ${viewModel.currentBottomNavIndex}',
        );
        debugPrint(
          'Current Index Tab => $indexToNavigate',
        );
        viewModel.previousSelectedIndex = viewModel.currentBottomNavIndex;
        viewModel.currentBottomNavIndex = indexToNavigate;
      } else {
        _animationController.forward();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: animated_app_bar.AppBar(
        animationController: _animationController,
        title: Text(widget.router.routeName),
      ),
      body: widget.router,
      bottomNavigationBar: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) => SizeTransition(
          sizeFactor: Tween(begin: 1.0, end: 0.0).animate(_animationController),
          child: child,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: DashboardRoutes.tabs[0].toUpperCase(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_rounded),
              label: DashboardRoutes.tabs[1].toUpperCase(),
            ),
          ],
          currentIndex: viewModel.currentBottomNavIndex,
          onTap: (index) => QR.toName(DashboardRoutes.tabs[index]),
        ),
      ),
    );
  }
}
