// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_variant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorVariantEntity _$ColorVariantEntityFromJson(Map<String, dynamic> json) =>
    ColorVariantEntity(
      color: json['color'] == null
          ? null
          : ColorAttributeEntity.fromJson(
              json['color'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      rewardPoint: (json['rewardPoint'] as num?)?.toInt() ?? 0,
      strikePrice: (json['strikePrice'] as num?)?.toInt() ?? 0,
      offPercent: (json['offPercent'] as num?)?.toInt() ?? 0,
      minOrder: (json['minOrder'] as num?)?.toInt() ?? 0,
      maxOrder: (json['maxOrder'] as num?)?.toInt() ?? 0,
      status: json['status'] as bool? ?? false,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      productCode: json['productCode'] as String? ?? '',
      id: json['_id'] as String? ?? '',
    );

Map<String, dynamic> _$ColorVariantEntityToJson(ColorVariantEntity instance) =>
    <String, dynamic>{
      'color': instance.color,
      'price': instance.price,
      'rewardPoint': instance.rewardPoint,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'status': instance.status,
      'images': instance.images,
      'productCode': instance.productCode,
      '_id': instance.id,
    };
