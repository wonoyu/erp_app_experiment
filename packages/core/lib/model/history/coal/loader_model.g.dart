// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loader_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoaderResponse _$$_LoaderResponseFromJson(Map<String, dynamic> json) =>
    _$_LoaderResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoaderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_LoaderResponseToJson(_$_LoaderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

_$_LoaderModel _$$_LoaderModelFromJson(Map<String, dynamic> json) =>
    _$_LoaderModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_LoaderModelToJson(_$_LoaderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
