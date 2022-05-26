import 'package:freezed_annotation/freezed_annotation.dart';
import 'coal_model.dart';

part 'coal_response.freezed.dart';
part 'coal_response.g.dart';

@freezed
abstract class CoalResponse with _$CoalResponse {
  factory CoalResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'data') List<CoalModel>? data,
    @JsonKey(name: 'message') String? message,
  }) = _CoalResponse;

  factory CoalResponse.fromJson(Map<String, dynamic> json) =>
      _$CoalResponseFromJson(json);
}

extension CoalResponseX on CoalResponse {
  // @late
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return data!.isNotEmpty;
  }

  bool hasErrors() {
    return data!.isNotEmpty;
  }
}
