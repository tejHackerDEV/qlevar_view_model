import 'package:flutter/widgets.dart';
import 'package:qlevar_router/qlevar_router.dart';

/// Basically [QViewModel] holds the business logic required by the page.
/// Also only one [QViewModel] should be associated with a page in general
abstract class QViewModel {
  /// Invoked when ever an [QViewModel] is about to inject into the memory.
  /// [qParams] are the parameters that has been passed to the route.
  ///
  /// This callback will be useful if we want to initialize some variables required by the [QViewModel]
  @mustCallSuper
  void onInit(QParams? qParams) {
    WidgetsBinding.instance.addPostFrameCallback((_) => onPostFrame());
  }

  /// Invoked one frame after [onInit] is called.
  ///
  /// This callback will be useful if we want to do async api requests & other stuff like that
  @mustCallSuper
  void onPostFrame() {}

  /// Invoked before removing the [QViewModel] from the memory.
  ///
  /// This callback will be useful if we want to dispose the variables used by the [QViewModel]
  /// like streams, events, controllers (like textEditingControllers & so),
  @mustCallSuper
  void onDispose() {}
}
