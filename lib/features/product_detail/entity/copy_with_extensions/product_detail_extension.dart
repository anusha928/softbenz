import 'package:softbenz_task/features/product_detail/entity/brand_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/category_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/product_detail_entity.dart';

extension ProductDetailEntityCopyWith on ProductDetailEntity {
  ProductDetailEntity copyWith({
    String? id,
    CategoryEntity? category,
    String? title,
    String? ingredient,
    String? howToUse,
    String? description,
    int? price,
    int? strikePrice,
    int? offPercent,
    List<String>? images,
    List<Map<String, dynamic>>? colorAttributes,
    String? variantType,
    List<ColorVariantEntity>? colorVariants,
    int? ratings,
    bool? wished,
    BrandEntity? brand,
  }) {
    return ProductDetailEntity(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      ingredient: ingredient ?? this.ingredient,
      howToUse: howToUse ?? this.howToUse,
      description: description ?? this.description,
      price: price ?? this.price,
      strikePrice: strikePrice ?? this.strikePrice,
      offPercent: offPercent ?? this.offPercent,
      images: images ?? List.from(this.images),
      colorAttributes: colorAttributes ?? List.from(this.colorAttributes),
      variantType: variantType ?? this.variantType,
      colorVariants: colorVariants ?? List.from(this.colorVariants),
      ratings: ratings ?? this.ratings,
      wished: wished ?? this.wished,
      brand: brand ?? this.brand,
    );
  }
}
