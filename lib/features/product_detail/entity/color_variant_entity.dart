import 'package:json_annotation/json_annotation.dart';
import 'package:softbenz_task/features/product_detail/entity/color_attribute_entity.dart';

part 'color_variant_entity.g.dart';

@JsonSerializable()
class ColorVariantEntity {
  ColorVariantEntity(
      {this.color,
      this.price,
      this.rewardPoint,
      this.strikePrice,
      this.offPercent,
      this.minOrder,
      this.maxOrder,
      this.status,
      this.images,
      this.productCode,
      this.id,
      this.isSelected});

  @JsonKey(name: 'color', includeIfNull: true)
  final ColorAttributeEntity? color;

  @JsonKey(name: 'price', defaultValue: 0, includeIfNull: true)
  final int? price;

  @JsonKey(name: 'rewardPoint', defaultValue: 0, includeIfNull: true)
  final int? rewardPoint;

  @JsonKey(name: 'strikePrice', defaultValue: 0, includeIfNull: true)
  final int? strikePrice;

  @JsonKey(name: 'offPercent', defaultValue: 0, includeIfNull: true)
  final int? offPercent;

  @JsonKey(name: 'minOrder', defaultValue: 0, includeIfNull: true)
  final int? minOrder;

  @JsonKey(name: 'maxOrder', defaultValue: 0, includeIfNull: true)
  final int? maxOrder;

  @JsonKey(name: 'status', defaultValue: false, includeIfNull: true)
  final bool? status;

  @JsonKey(name: 'images', defaultValue: [], includeIfNull: true)
  final List<String>? images;

  @JsonKey(name: 'productCode', defaultValue: "", includeIfNull: true)
  final String? productCode;

  @JsonKey(name: '_id', defaultValue: "", includeIfNull: true)
  final String? id;

  @JsonKey(
      name: 'isSelected',
      defaultValue: false,
      includeFromJson: false,
      includeIfNull: true)
  bool? isSelected;

  factory ColorVariantEntity.fromJson(Map<String, dynamic> json) =>
      _$ColorVariantEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ColorVariantEntityToJson(this);
}
