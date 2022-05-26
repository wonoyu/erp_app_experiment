import 'package:freezed_annotation/freezed_annotation.dart';

part 'problem_model.freezed.dart';
part 'problem_model.g.dart';

@freezed
abstract class ProblemResponse with _$ProblemResponse {
  factory ProblemResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'data') List<ProblemModel>? data,
    @JsonKey(name: 'message') String? message,
  }) = _ProblemResponse;

  factory ProblemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProblemResponseFromJson(json);
}

extension ProblemResponseX on ProblemResponse {
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
class ProblemModel with _$ProblemModel {
  factory ProblemModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
  }) = _ProblemModel;

  factory ProblemModel.fromJson(Map<String, dynamic> json) =>
      _$ProblemModelFromJson(json);
}
