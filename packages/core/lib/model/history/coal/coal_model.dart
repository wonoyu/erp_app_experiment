import 'package:freezed_annotation/freezed_annotation.dart';

part 'coal_model.freezed.dart';
part 'coal_model.g.dart';

@freezed
class CoalModel with _$CoalModel {
  factory CoalModel({
    @JsonKey(name: 'unit_loader_name') String? unitLoaderName,
    @JsonKey(name: 'unit_loader_id') int? loaderId,
    @JsonKey(name: 'plan_prod_activity_id') int? activityId,
    @JsonKey(name: 'event_date') String? eventDate,
    @JsonKey(name: 'productivity_problem_id') int? problemId,
    @JsonKey(name: 'desc') String? desc,
    @JsonKey(name: 'multiHauler') List<Map<String, dynamic>>? multiHauler,
    @JsonKey(name: 'material_type') String? materialType,
    @JsonKey(name: 'last_prod') String? lastProd,
    @JsonKey(name: 'shift') num? shift,
    @JsonKey(name: 'company_site_id') int? id,
    @JsonKey(name: 'jarak') num? distance,
    @JsonKey(name: 'total_rit') num? totalRit,
    @JsonKey(name: 'total_bcm') num? totalBCM,
    @JsonKey(name: 'hauler') String? hauler,
  }) = _CoalModel;

  factory CoalModel.fromJson(Map<String, dynamic> json) =>
      _$CoalModelFromJson(json);
}
