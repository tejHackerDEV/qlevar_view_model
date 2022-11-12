import 'package:flutter/foundation.dart' show debugPrint;
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

class DashboardViewModel extends QViewModel {
  int currentBottomNavIndex = 0;
  int previousSelectedIndex = 0;

  @override
  void onInit(QParams? qParams) {
    debugPrint('$runtimeType initiated');
    super.onInit(qParams);
  }

  @override
  void onPostFrame() {
    debugPrint('$runtimeType onPostFrame');
    super.onPostFrame();
  }

  @override
  void onDispose() {
    debugPrint('$runtimeType disposed');
    super.onDispose();
  }
}
