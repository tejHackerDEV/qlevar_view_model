import 'dart:collection';

import 'package:qlevar_router/qlevar_router.dart';

import '../qlevar_view_model.dart';

abstract class QViewModelInstances {
  S? get<S extends QViewModel>();
}

class QViewModelInstancesImpl<T extends QViewModel>
    implements QViewModelInstances {
  final HashMap<String, T> _viewModels;
  static final QViewModelInstancesImpl _instance =
      QViewModelInstancesImpl._internal();

  factory QViewModelInstancesImpl() => _instance as QViewModelInstancesImpl<T>;

  QViewModelInstancesImpl._internal() : _viewModels = HashMap();

  T put(String key, T value, {QParams? qParams}) =>
      _viewModels.putIfAbsent(key, () => value)..onInit(qParams);

  @override
  S? get<S extends QViewModel>() {
    // First directly check the viewModel can find in the currentPath
    // or not.
    //
    // If not then go & loop through all the viewModels injected into the memory
    QViewModel? viewModel = _viewModels[QR.currentPath];
    if (viewModel is S) {
      return viewModel;
    }
    QR.log('Requesting viewModel that doesn\'t belong to the current path');
    for (final entry in _viewModels.entries) {
      viewModel = entry.value;
      if (viewModel is S) {
        return viewModel;
      }
    }
    QR.log('No ViewModel found in the memory');
    return null;
  }

  T? remove(String key) => _viewModels.remove(key)?..onDispose();
}
