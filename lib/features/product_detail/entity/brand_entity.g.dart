// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandEntity _$BrandEntityFromJson(Map<String, dynamic> json) => BrandEntity(
      id: json['_id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$BrandEntityToJson(BrandEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };
