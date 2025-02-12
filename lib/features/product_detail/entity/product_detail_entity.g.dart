// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailEntity _$ProductDetailEntityFromJson(Map<String, dynamic> json) =>
    ProductDetailEntity(
      id: json['_id'] as String? ?? '',
      category: json['category'] == null
          ? null
          : CategoryEntity.fromJson(json['category'] as Map<String, dynamic>),
      title: json['title'] as String? ?? '',
      ingredient: json['ingredient'] as String? ?? '',
      howToUse: json['howToUse'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      strikePrice: (json['strikePrice'] as num?)?.toInt() ?? 0,
      offPercent: (json['offPercent'] as num?)?.toInt() ?? 0,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      colorAttributes: (json['colorAttributes'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      variantType: json['variantType'] as String? ?? '',
      colorVariants: (json['colorVariants'] as List<dynamic>?)
              ?.map(
                  (e) => ColorVariantEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ratings: (json['ratings'] as num?)?.toInt() ?? 0,
      wished: json['wished'] as bool? ?? false,
      brand: json['brand'] == null
          ? null
          : BrandEntity.fromJson(json['brand'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailEntityToJson(
        ProductDetailEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'ingredient': instance.ingredient,
      'howToUse': instance.howToUse,
      'description': instance.description,
      'price': instance.price,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'images': instance.images,
      'colorAttributes': instance.colorAttributes,
      'variantType': instance.variantType,
      'colorVariants': instance.colorVariants,
      'ratings': instance.ratings,
      'wished': instance.wished,
      'brand': instance.brand,
    };
