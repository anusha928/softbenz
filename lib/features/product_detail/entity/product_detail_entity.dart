import 'package:json_annotation/json_annotation.dart';
import 'package:softbenz_task/features/product_detail/entity/brand_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/category_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
part 'product_detail_entity.g.dart';

@JsonSerializable()
class ProductDetailEntity {
  @JsonKey(name: "_id", defaultValue: "", includeIfNull: true)
  final String id;

  @JsonKey(name: "category", includeIfNull: true)
  final CategoryEntity? category;

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

  @JsonKey(name: "strikePrice", defaultValue: 0, includeIfNull: true)
  final int strikePrice;

  @JsonKey(name: "offPercent", defaultValue: 0, includeIfNull: true)
  final int offPercent;

  @JsonKey(name: "images", defaultValue: [], includeIfNull: true)
  final List<String> images;

  @JsonKey(name: "colorAttributes", defaultValue: [], includeIfNull: true)
  final List<Map<String, dynamic>> colorAttributes;

  @JsonKey(name: "variantType", defaultValue: "", includeIfNull: true)
  final String variantType;

  @JsonKey(name: "colorVariants", defaultValue: [], includeIfNull: true)
  final List<ColorVariantEntity> colorVariants;

  @JsonKey(name: "ratings", defaultValue: 0, includeIfNull: true)
  final int ratings;

  @JsonKey(name: "wished", defaultValue: false, includeIfNull: true)
  final bool wished;

  @JsonKey(name: "brand", includeIfNull: true)
  final BrandEntity? brand;

  ProductDetailEntity(
      {required this.id,
      required this.category,
      required this.title,
      required this.ingredient,
      required this.howToUse,
      required this.description,
      required this.price,
      required this.strikePrice,
      required this.offPercent,
      required this.images,
      required this.colorAttributes,
      required this.variantType,
      required this.colorVariants,
      required this.ratings,
      required this.wished,
      this.brand});

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailEntityToJson(this);
}
