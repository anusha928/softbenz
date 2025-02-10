// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailEntity _$ProductDetailEntityFromJson(Map<String, dynamic> json) =>
    ProductDetailEntity(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      category: json['category'] as Map<String, dynamic>? ?? {},
      brand: json['brand'] as Map<String, dynamic>? ?? {},
      title: json['title'] as String? ?? '',
      ingredient: json['ingredient'] as String? ?? '',
      howToUse: json['howToUse'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      rewardPoint: (json['rewardPoint'] as num?)?.toInt() ?? 0,
      commissionPercentage:
          (json['commissionPercentage'] as num?)?.toInt() ?? 0,
      strikePrice: (json['strikePrice'] as num?)?.toInt() ?? 0,
      offPercent: (json['offPercent'] as num?)?.toInt() ?? 0,
      minOrder: (json['minOrder'] as num?)?.toInt() ?? 0,
      maxOrder: (json['maxOrder'] as num?)?.toInt() ?? 0,
      status: json['status'] as bool? ?? false,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      colorAttributes: (json['colorAttributes'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      sizeAttributes: (json['sizeAttributes'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      variantType: json['variantType'] as String? ?? '',
      colorVariants: (json['colorVariants'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      ratings: (json['ratings'] as num?)?.toInt() ?? 0,
      totalRatings: (json['totalRatings'] as num?)?.toInt() ?? 0,
      ratedBy: (json['ratedBy'] as num?)?.toInt() ?? 0,
      metaRobots: json['metaRobots'] as String? ?? '',
      isTodaysDeal: json['isTodaysDeal'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isPublished: json['isPublished'] as bool? ?? false,
      searchWords: json['searchWords'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
      sizeVariants: (json['sizeVariants'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      v: (json['__v'] as num?)?.toInt() ?? 0,
      noneText: json['noneText'] as String? ?? '',
      breadCrums: (json['breadCrums'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
      wished: json['wished'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductDetailEntityToJson(
        ProductDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'category': instance.category,
      'brand': instance.brand,
      'title': instance.title,
      'ingredient': instance.ingredient,
      'howToUse': instance.howToUse,
      'description': instance.description,
      'price': instance.price,
      'rewardPoint': instance.rewardPoint,
      'commissionPercentage': instance.commissionPercentage,
      'strikePrice': instance.strikePrice,
      'offPercent': instance.offPercent,
      'minOrder': instance.minOrder,
      'maxOrder': instance.maxOrder,
      'status': instance.status,
      'images': instance.images,
      'colorAttributes': instance.colorAttributes,
      'sizeAttributes': instance.sizeAttributes,
      'variantType': instance.variantType,
      'colorVariants': instance.colorVariants,
      'ratings': instance.ratings,
      'totalRatings': instance.totalRatings,
      'ratedBy': instance.ratedBy,
      'metaRobots': instance.metaRobots,
      'isTodaysDeal': instance.isTodaysDeal,
      'isFeatured': instance.isFeatured,
      'isPublished': instance.isPublished,
      'searchWords': instance.searchWords,
      'isDeleted': instance.isDeleted,
      'sizeVariants': instance.sizeVariants,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'noneText': instance.noneText,
      'breadCrums': instance.breadCrums,
      'wished': instance.wished,
    };
