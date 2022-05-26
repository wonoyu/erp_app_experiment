import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_prod_activity_model.freezed.dart';
part 'plan_prod_activity_model.g.dart';

@freezed
abstract class PlanProdResponse with _$PlanProdResponse {
  factory PlanProdResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'data') List<PlanProdModel>? data,
    @JsonKey(name: 'message') String? message,
  }) = _PlanProdResponse;

  factory PlanProdResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanProdResponseFromJson(json);
}

extension PlanProdResponseX on PlanProdResponse {
  // @late
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return data!.isNotEmpty;
  }

  bool hasErrors() {
    return data!.isNotEmpty;
  }
}

@freezed
class PlanProdModel with _$PlanProdModel {
  factory PlanProdModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'plan_prod_activity_group_id') int? planProdActivityGroupId,
    @JsonKey(name: 'code') String? code,
  }) = _PlanProdModel;

  factory PlanProdModel.fromJson(Map<String, dynamic> json) =>
      _$PlanProdModelFromJson(json);
}
