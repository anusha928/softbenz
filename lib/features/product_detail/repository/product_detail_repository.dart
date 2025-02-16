import 'package:dartz/dartz.dart';
import 'package:softbenz_task/core/api/api_provider.dart';
import 'package:softbenz_task/core/app/end_point_const.dart';
import 'package:softbenz_task/core/error_handling/exception.dart';
import 'package:softbenz_task/features/product_detail/entity/copy_with_extensions/color_varient_extension.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/features/product_detail/entity/product_detail_entity.dart';

class ProductDetailRepository {
  final ApiProvider apiProvider;

  ProductDetailRepository({required this.apiProvider});

  ProductDetailEntity? productDetail;

  Future<Either<String, ProductDetailEntity>> getProductDetail() async {
    try {
      final res = await apiProvider.get(EndPointConst.productDetailApi);
      productDetail = ProductDetailEntity.fromJson(res["data"]["data"]);
      productDetail!.colorVariants[0].isSelected = true;
      return Right(productDetail!);
    } on Failure catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  updateColor(String variantId) {
    List<ColorVariantEntity> updatedVariants = productDetail!.colorVariants
        .map((variant) => variant.copyWith(isSelected: variant.id == variantId))
        .toList();
    return updatedVariants;
  }
}
