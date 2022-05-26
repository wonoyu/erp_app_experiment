// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoalModel _$$_CoalModelFromJson(Map<String, dynamic> json) => _$_CoalModel(
      unitLoaderName: json['unit_loader_name'] as String?,
      loaderId: json['unit_loader_id'] as int?,
      activityId: json['plan_prod_activity_id'] as int?,
      eventDate: json['event_date'] as String?,
      problemId: json['productivity_problem_id'] as int?,
      desc: json['desc'] as String?,
      multiHauler: (json['multiHauler'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      materialType: json['material_type'] as String?,
      lastProd: json['last_prod'] as String?,
      shift: json['shift'] as num?,
      id: json['company_site_id'] as int?,
      distance: json['jarak'] as num?,
      totalRit: json['total_rit'] as num?,
      totalBCM: json['total_bcm'] as num?,
      hauler: json['hauler'] as String?,
    );

Map<String, dynamic> _$$_CoalModelToJson(_$_CoalModel instance) =>
    <String, dynamic>{
      'unit_loader_name': instance.unitLoaderName,
      'unit_loader_id': instance.loaderId,
      'plan_prod_activity_id': instance.activityId,
      'event_date': instance.eventDate,
      'productivity_problem_id': instance.problemId,
      'desc': instance.desc,
      'multiHauler': instance.multiHauler,
      'material_type': instance.materialType,
      'last_prod': instance.lastProd,
      'shift': instance.shift,
      'company_site_id': instance.id,
      'jarak': instance.distance,
      'total_rit': instance.totalRit,
      'total_bcm': instance.totalBCM,
      'hauler': instance.hauler,
    };
