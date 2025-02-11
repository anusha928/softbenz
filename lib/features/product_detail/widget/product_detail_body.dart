import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_cubit.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_state.dart';
import 'package:softbenz_task/features/product_detail/entity/product_detail_entity.dart';
import 'package:softbenz_task/features/product_detail/widget/product_image_widget.dart';
import 'package:softbenz_task/gen/assets.gen.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({super.key});

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  void initState() {
    context.read<ProductDetailCubit>().fetchProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.colorWhite,
      appBar: AppBar(
        title: Text("Smart Sync Lipstick"),
        backgroundColor: ColorName.colorWhite,
        toolbarHeight: 70.hp,
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductDetailErrorState) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is ProductDetailSuccessState) {
            return _createProductDetailBody(
                state.product); // Replace with your UI
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  _createProductDetailBody(ProductDetailEntity product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageWidget(images: product.images),
          SizedBox(
            height: 20.hp,
          ),
          _createProductDetail()
        ],
      ),
    );
  }

  _createProductDetail() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.wp),
        child: Column(
          children: [_createProductTitle()],
        ));
  }

  _createProductTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              text: "The One",
              fontSize: 16.hp,
              family: FontFamily.barlowSemiBold,
              weight: FontWeight.w600,
              color: ColorName.colorGrayText,
            ),
            SizedBox(
              height: 14.hp,
            ),
            BuildText(
              text: "Smart Sync Lipstick",
              fontSize: 16.hp,
              family: FontFamily.barlowMedium,
              weight: FontWeight.w500,
              color: ColorName.colorBlack,
            ),
          ],
        ),
        Spacer(),
        Assets.images.favourite.image(
          height: 25.hp,
          color: ColorName.colorPrimary,
        ),
        SizedBox(
          width: 10.wp,
        ),
        CustomFilledButton(
            title: "Share",
            fontColor: ColorName.colorBlack,
            fontFamily: FontFamily.barlowRegular,
            fontSize: 14.hp,
            fontWeight: FontWeight.w500,
            buttonColor: ColorName.colorSecondary,
            prefixIcon: Assets.svg.icShare
                .svg(height: 14.hp, color: ColorName.colorBlack))
      ],
    );
  }
}
