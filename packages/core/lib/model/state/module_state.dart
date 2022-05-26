import 'package:core/model/login_model.dart';
import 'package:core/model/module_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_state.freezed.dart';

@freezed
abstract class ModuleState with _$ModuleState {
  const factory ModuleState.loaded(List<ModuleModel> data) =
      _Loaded;
  const factory ModuleState.error(String errorText) = _Error;
  const factory ModuleState.loading(List<ModuleModel> data) = _Loading;
}
