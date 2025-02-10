// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bread_crumb_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreadCrumbEntity _$BreadCrumbEntityFromJson(Map<String, dynamic> json) =>
    BreadCrumbEntity(
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$BreadCrumbEntityToJson(BreadCrumbEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
    };
