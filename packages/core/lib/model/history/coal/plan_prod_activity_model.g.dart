// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_prod_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlanProdResponse _$$_PlanProdResponseFromJson(Map<String, dynamic> json) =>
    _$_PlanProdResponse(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PlanProdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_PlanProdResponseToJson(_$_PlanProdResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

_$_PlanProdModel _$$_PlanProdModelFromJson(Map<String, dynamic> json) =>
    _$_PlanProdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      planProdActivityGroupId: json['plan_prod_activity_group_id'] as int?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$_PlanProdModelToJson(_$_PlanProdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'plan_prod_activity_group_id': instance.planProdActivityGroupId,
      'code': instance.code,
    };
