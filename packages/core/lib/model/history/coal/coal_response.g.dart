// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoalResponse _$$_CoalResponseFromJson(Map<String, dynamic> json) =>
    _$_CoalResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CoalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_CoalResponseToJson(_$_CoalResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
