// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hauler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HaulerResponse _$$_HaulerResponseFromJson(Map<String, dynamic> json) =>
    _$_HaulerResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HaulerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_HaulerResponseToJson(_$_HaulerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

_$_HaulerModel _$$_HaulerModelFromJson(Map<String, dynamic> json) =>
    _$_HaulerModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_HaulerModelToJson(_$_HaulerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
    };
