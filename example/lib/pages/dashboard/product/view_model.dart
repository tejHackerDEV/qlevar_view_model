import 'dart:math' as math;

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

import '../../../routes/dashboard_routes.dart';

class ProductViewModel extends QViewModel {
  late String title;
  @override
  void onInit(QParams? qParams) {
    title = 'Product ${qParams![ProductsParams.id]!.asInt!}';
    debugPrint('$runtimeType $title initiated');
    super.onInit(qParams);
  }

  int get getNextRandomProduct => math.Random().nextInt(400);

  @override
  void onPostFrame() {
    debugPrint('$runtimeType $title onPostFrame');
    super.onPostFrame();
  }

  @override
  void onDispose() {
    debugPrint('$runtimeType $title disposed');
    super.onDispose();
  }
}
