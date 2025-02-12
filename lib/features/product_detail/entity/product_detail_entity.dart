import 'package:json_annotation/json_annotation.dart';
import 'package:softbenz_task/features/product_detail/entity/brand_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/category_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/color_attribute_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
part 'product_detail_entity.g.dart';

@JsonSerializable()
class ProductDetailEntity {
  @JsonKey(name: "_id", defaultValue: "", includeIfNull: true)
  final String id;

  @JsonKey(name: "slug", defaultValue: "", includeIfNull: true)
  final String slug;

  @JsonKey(name: "category", includeIfNull: true)
  final CategoryEntity? category;

  @JsonKey(name: "brand", includeIfNull: true)
  final BrandEntity? brand;

  @JsonKey(name: "title", defaultValue: "", includeIfNull: true)
  final String? title;

  @JsonKey(name: "ingredient", defaultValue: "", includeIfNull: true)
  final String? ingredient;

  @JsonKey(name: "howToUse", defaultValue: "", includeIfNull: true)
  final String howToUse;

  @JsonKey(name: "description", defaultValue: "", includeIfNull: true)
  final String description;

  @JsonKey(name: "price", defaultValue: 0, includeIfNull: true)
  final int price;

  @JsonKey(name: "rewardPoint", defaultValue: 0, includeIfNull: true)
  final int rewardPoint;

  @JsonKey(name: "commissionPercentage", defaultValue: 0, includeIfNull: true)
  final int commissionPercentage;

  @JsonKey(name: "strikePrice", defaultValue: 0, includeIfNull: true)
  final int strikePrice;

  @JsonKey(name: "offPercent", defaultValue: 0, includeIfNull: true)
  final int offPercent;

  @JsonKey(name: "minOrder", defaultValue: 0, includeIfNull: true)
  final int minOrder;

  @JsonKey(name: "maxOrder", defaultValue: 0, includeIfNull: true)
  final int maxOrder;

  @JsonKey(name: "status", defaultValue: false, includeIfNull: true)
  final bool status;

  @JsonKey(name: "images", defaultValue: [], includeIfNull: true)
  final List<String> images;

  @JsonKey(name: "colorAttributes", defaultValue: [], includeIfNull: true)
  final List<Map<String, dynamic>> colorAttributes;

  @JsonKey(name: "sizeAttributes", defaultValue: [], includeIfNull: true)
  final List<ColorAttributeEntity> sizeAttributes;

  @JsonKey(name: "variantType", defaultValue: "", includeIfNull: true)
  final String variantType;

  @JsonKey(name: "colorVariants", defaultValue: [], includeIfNull: true)
  final List<ColorVariantEntity> colorVariants;

  @JsonKey(name: "ratings", defaultValue: 0, includeIfNull: true)
  final int ratings;

  @JsonKey(name: "totalRatings", defaultValue: 0, includeIfNull: true)
  final int totalRatings;

  @JsonKey(name: "ratedBy", defaultValue: 0, includeIfNull: true)
  final int ratedBy;

  @JsonKey(name: "metaRobots", defaultValue: "", includeIfNull: true)
  final String metaRobots;

  @JsonKey(name: "isTodaysDeal", defaultValue: false, includeIfNull: true)
  final bool isTodaysDeal;

  @JsonKey(name: "isFeatured", defaultValue: false, includeIfNull: true)
  final bool isFeatured;

  @JsonKey(name: "isPublished", defaultValue: false, includeIfNull: true)
  final bool isPublished;

  @JsonKey(name: "searchWords", defaultValue: "", includeIfNull: true)
  final String searchWords;

  @JsonKey(name: "isDeleted", defaultValue: false, includeIfNull: true)
  final bool isDeleted;

  @JsonKey(name: "sizeVariants", defaultValue: [], includeIfNull: true)
  final List<Map<String, dynamic>> sizeVariants;

  @JsonKey(name: "createdAt", defaultValue: "", includeIfNull: true)
  final String createdAt;

  @JsonKey(name: "updatedAt", defaultValue: "", includeIfNull: true)
  final String updatedAt;

  @JsonKey(name: "__v", defaultValue: 0, includeIfNull: true)
  final int v;

  @JsonKey(name: "noneText", defaultValue: "", includeIfNull: true)
  final String noneText;

  @JsonKey(name: "breadCrums", defaultValue: [], includeIfNull: true)
  final List<Map<String, dynamic>> breadCrums;

  @JsonKey(name: "wished", defaultValue: false, includeIfNull: true)
  final bool wished;

  ProductDetailEntity({
    required this.id,
    required this.slug,
    required this.category,
    required this.brand,
    required this.title,
    required this.ingredient,
    required this.howToUse,
    required this.description,
    required this.price,
    required this.rewardPoint,
    required this.commissionPercentage,
    required this.strikePrice,
    required this.offPercent,
    required this.minOrder,
    required this.maxOrder,
    required this.status,
    required this.images,
    required this.colorAttributes,
    required this.sizeAttributes,
    required this.variantType,
    required this.colorVariants,
    required this.ratings,
    required this.totalRatings,
    required this.ratedBy,
    required this.metaRobots,
    required this.isTodaysDeal,
    required this.isFeatured,
    required this.isPublished,
    required this.searchWords,
    required this.isDeleted,
    required this.sizeVariants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.noneText,
    required this.breadCrums,
    required this.wished,
  });

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailEntityToJson(this);
}
