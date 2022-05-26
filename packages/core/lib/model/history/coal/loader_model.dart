import 'package:freezed_annotation/freezed_annotation.dart';

part 'loader_model.freezed.dart';
part 'loader_model.g.dart';

@freezed
abstract class LoaderResponse with _$LoaderResponse {
  factory LoaderResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'data') List<LoaderModel>? data,
    @JsonKey(name: 'message') String? message,
  }) = _LoaderResponse;

  factory LoaderResponse.fromJson(Map<String, dynamic> json) =>
      _$LoaderResponseFromJson(json);
}

extension LoaderResponseX on LoaderResponse {
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
class LoaderModel with _$LoaderModel {
  factory LoaderModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
  }) = _LoaderModel;

  factory LoaderModel.fromJson(Map<String, dynamic> json) =>
      _$LoaderModelFromJson(json);
}
