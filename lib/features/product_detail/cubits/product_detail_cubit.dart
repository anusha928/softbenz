import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_state.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/features/product_detail/repository/product_detail_repository.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepository repository;
  ProductDetailCubit({required this.repository})
      : super(ProductDetailInitialState());

  fetchProductDetail() async {
    emit(ProductDetailLoadingState());
    final res = await repository.getProductDetail();
    res.fold(
      (err) => emit(ProductDetailErrorState(message: err)),
      (data) => emit(ProductDetailSuccessState(product: data)),
    );
  }

  setColorVarient(String id, List<ColorVariantEntity> colorVarient) {
    if (state is ProductDetailSuccessState) {
      for (ColorVariantEntity item in colorVarient) {
        if (item.id == id) {
          item.isSelected = true;
        }
      }
    }
  }
}
