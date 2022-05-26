import 'package:core/model/history/coal/plan_prod_activity_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_prod_state.freezed.dart';

@freezed
abstract class PlanProdState with _$PlanProdState {
  const factory PlanProdState.data(Map<String, dynamic>? data) = _Data;
  const factory PlanProdState.dataLoading(Map<String, dynamic>? data) =
      _DataLoading;
  const factory PlanProdState.error(String error) = _Error;
}
