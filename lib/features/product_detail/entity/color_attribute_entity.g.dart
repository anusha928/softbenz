// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_attribute_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorAttributeEntity _$ColorAttributeEntityFromJson(
        Map<String, dynamic> json) =>
    ColorAttributeEntity(
      id: json['_id'] as String? ?? '',
      isTwin: json['isTwin'] as bool? ?? false,
      name: json['name'] as String? ?? '',
      colorValue: (json['colorValue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$ColorAttributeEntityToJson(
        ColorAttributeEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isTwin': instance.isTwin,
      'name': instance.name,
      'colorValue': instance.colorValue,
    };
