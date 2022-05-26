import 'package:freezed_annotation/freezed_annotation.dart';

part 'hauler_model.freezed.dart';
part 'hauler_model.g.dart';

@freezed
abstract class HaulerResponse with _$HaulerResponse {
  factory HaulerResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'data') List<HaulerModel>? data,
    @JsonKey(name: 'message') String? message,
  }) = _HaulerResponse;

  factory HaulerResponse.fromJson(Map<String, dynamic> json) =>
      _$HaulerResponseFromJson(json);
}

extension HaulerResponseX on HaulerResponse {
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
class HaulerModel with _$HaulerModel {
  factory HaulerModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'code') String? code,
  }) = _HaulerModel;

  factory HaulerModel.fromJson(Map<String, dynamic> json) =>
      _$HaulerModelFromJson(json);
}
