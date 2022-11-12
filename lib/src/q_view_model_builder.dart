import 'dart:async';

import 'package:qlevar_router/qlevar_router.dart';
import 'package:qlevar_view_model/src/utils/extension/iterable.dart';

import 'q_view_model.dart';
import 'q_view_model_instances.dart';

/// This is wrapper on top of [QMiddleware] which will bind & remove [QViewModel]
/// automatically for the respective page based on navigation.
///
/// If you are using this along with some other middlewares too then make sure the order you call it,
/// because [QViewModel] will be injected into the memory. So if the route has some [redirectGuard]
/// then declare this [QViewModelBuilder] middleware below [redirectGuard], because if the [redirectGuard]
/// fails then there is no point of binding [QViewModel] into the memory. We need to bind only if the
/// [redirectGuard] succeeds also make sure tho call this as the first middleware after [redirectGuard]
/// so that your [QViewModel] will be get bind to the page & be available to all other middlewares(in-case if you need so)
///
/// Example:-
/// ```
/// QRoute(
///   name: 'my-page',
///   path: '/my-page',
///   middleware: [
///     // AuthMiddleware(),
///     QViewModelBuilder(() => MyPageViewModel()), // called after redirectGuard & before other middlewares
///     // OtherMiddleware(),
///     // OneMoreMiddleware()
///   ],
///   builder: () => const MyPage(),
/// ),
/// ```
class QViewModelBuilder<T extends QViewModel> extends QMiddleware {
  final FutureOr<T> Function() _builder;

  /// This is needed because if we have a path say [/products/:id]
  /// & [id] is dynamic, we will have unique viewModel for each id that is generated
  /// but by default [QR] don't treat such way, it will treat the route as only one
  /// no matter how many you visit by changing the id, thus same builder will keep on calling again & again
  /// & if you navigates among these kind of routes sometimes it deletes the
  /// viewModel of the route that is still not removed from the tree. So in-order to deal
  /// that issue, in one builder it-self we will have a set of paths
  /// & keep pushing the dynamic paths into it onEnter & onExited (duplicate paths will not be inserted again)
  /// we will loop through these paths & removes those viewModels who's route has removed from the tree
  /// by checking the QHistory entries.
  final Set<String> _uniquePaths;
  final QViewModelInstancesImpl _qViewModelInstancesImpl;
  QViewModelBuilder(this._builder)
      : _uniquePaths = {},
        _qViewModelInstancesImpl = QViewModelInstancesImpl();

  @override
  Future onEnter() async {
    final currentPath = QR.currentPath;
    _qViewModelInstancesImpl.put(
      currentPath,
      await _builder(),
      qParams: QR.params,
    );
    _uniquePaths.add(QR.currentPath);
    QR.log('$currentPath viewModel injected successfully');
    return super.onEnter();
  }

  @override
  void onExited() {
    for (int i = _uniquePaths.length - 1; i >= 0; --i) {
      final uniquePath = _uniquePaths.elementAt(i);
      QR.log('Tyring to dispose viewModel of path:- $uniquePath');
      if (QR.history.entries
              .lastWhereOrNull((entry) => entry.path == uniquePath) !=
          null) {
        QR.log('Path still exists in the history so don\'t dispose viewModel');
        continue;
      }
      // Remove from instances also delete the path from set
      _qViewModelInstancesImpl.remove(uniquePath);
      _uniquePaths.remove(uniquePath);
      QR.log('$uniquePath viewModel disposed successfully');
    }
    super.onExited();
  }
}
