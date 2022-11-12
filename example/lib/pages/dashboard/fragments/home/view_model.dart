import 'dart:math' as math;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

class HomeFragmentViewModel extends QViewModel {
  late math.Random _random;

  @override
  void onInit(QParams? qParams) {
    debugPrint('$runtimeType initiated');
    _random = math.Random();
    super.onInit(qParams);
  }

  @override
  void onPostFrame() {
    debugPrint('$runtimeType onPostFrame');
    super.onPostFrame();
  }

  int priceByIndex(int index) => (index + 1) * _random.nextInt(100);

  @override
  void onDispose() {
    debugPrint('$runtimeType disposed');
    super.onDispose();
  }
}
