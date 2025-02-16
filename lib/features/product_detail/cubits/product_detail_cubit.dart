import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_state.dart';
import 'package:softbenz_task/features/product_detail/entity/copy_with_extensions/color_varient_extension.dart';
import 'package:softbenz_task/features/product_detail/entity/copy_with_extensions/product_detail_extension.dart';
import 'package:softbenz_task/features/product_detail/entity/product_detail_entity.dart';
import 'package:softbenz_task/features/product_detail/repository/product_detail_repository.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductDetailRepository repository;
  ProductDetailCubit({required this.repository})
      : super(ProductDetailInitialState());

  fetchProductDetail({String? varientId}) async {
    if (state is ProductDetailSuccessState && varientId != null) {
      final currentState = state as ProductDetailSuccessState;
      final ProductDetailEntity product = currentState.product;
      final updatedColorVariants = product.colorVariants
          .map((variant) =>
              variant.copyWith(isSelected: variant.id == varientId))
          .toList();
      final updatedProductDetail =
          product.copyWith(colorVariants: updatedColorVariants);

      emit(ProductDetailSuccessState(product: updatedProductDetail));
      return;
    }
    emit(ProductDetailLoadingState());
    final res = await repository.getProductDetail();
    res.fold(
      (err) => emit(ProductDetailErrorState(message: err)),
      (data) {
        if (varientId == null) {
          emit(ProductDetailSuccessState(product: data));
        }
        // else {
        //   final updatedColorVariants = data.colorVariants
        //       .map((variant) =>
        //           variant.copyWith(isSelected: variant.id == varientId))
        //       .toList();
        //   final updatedProductDetail =
        //       data.copyWith(colorVariants: updatedColorVariants);

        //   emit(ProductDetailSuccessState(product: updatedProductDetail));
        // }
      },
    );
  }
}
