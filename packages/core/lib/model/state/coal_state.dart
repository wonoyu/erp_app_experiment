import 'package:core/model/history/coal/coal_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coal_state.freezed.dart';

@freezed
abstract class CoalState with _$CoalState {
  const factory CoalState.data(List<CoalModel> coal) = _Data;
  const factory CoalState.dataLoading(List<CoalModel> coal) = _DataLoading;
  const factory CoalState.error(String error) = _Error;
}
