// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDataModel _$_$_UserDataModelFromJson(Map<String, dynamic> json) {
  return _$_UserDataModel(
    name: json['name'] as String,
    id: json['id'] as String,
    last_active: json['last_active'] == null
        ? null
        : DateTime.parse(json['last_active'] as String),
    val: (json['val'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    time: (json['time'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$_$_UserDataModelToJson(_$_UserDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'last_active': instance.last_active?.toIso8601String(),
      'val': instance.val,
      'time': instance.time,
    };
