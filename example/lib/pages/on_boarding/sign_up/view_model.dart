import 'package:flutter/widgets.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/qlevar_view_model.dart';

class SignupViewModel extends QViewModel {
  final TextEditingController textEditingController = TextEditingController();

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
    textEditingController.dispose();
    debugPrint('$runtimeType disposed');
    super.onDispose();
  }
}
