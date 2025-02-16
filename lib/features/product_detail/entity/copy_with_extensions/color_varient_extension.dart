import 'package:softbenz_task/features/product_detail/entity/color_attribute_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';

extension ColorVariantEntityCopyWith on ColorVariantEntity {
  ColorVariantEntity copyWith({
    ColorAttributeEntity? color,
    int? price,
    int? rewardPoint,
    int? strikePrice,
    int? offPercent,
    int? minOrder,
    int? maxOrder,
    bool? status,
    List<String>? images,
    String? productCode,
    String? id,
    bool? isSelected,
  }) {
    return ColorVariantEntity(
      color: color ?? this.color,
      price: price ?? this.price,
      rewardPoint: rewardPoint ?? this.rewardPoint,
      strikePrice: strikePrice ?? this.strikePrice,
      offPercent: offPercent ?? this.offPercent,
      minOrder: minOrder ?? this.minOrder,
      maxOrder: maxOrder ?? this.maxOrder,
      status: status ?? this.status,
      images: images ?? this.images,
      productCode: productCode ?? this.productCode,
      id: id ?? this.id,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}