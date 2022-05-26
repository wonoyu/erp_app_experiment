// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProblemResponse _$$_ProblemResponseFromJson(Map<String, dynamic> json) =>
    _$_ProblemResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProblemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_ProblemResponseToJson(_$_ProblemResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

_$_ProblemModel _$$_ProblemModelFromJson(Map<String, dynamic> json) =>
    _$_ProblemModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_ProblemModelToJson(_$_ProblemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
