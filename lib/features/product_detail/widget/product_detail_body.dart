import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/core/services/notification_service.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/core/widgets/expandaable_widget.dart';
import 'package:softbenz_task/core/widgets/price_widget.dart';
import 'package:softbenz_task/core/widgets/product_color_varient_widget.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_cubit.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_state.dart';
import 'package:softbenz_task/features/product_detail/entity/product_detail_entity.dart';
import 'package:softbenz_task/features/product_detail/widget/contact_seller.dart';
import 'package:softbenz_task/features/product_detail/widget/product_add_to_cart.dart';
import 'package:softbenz_task/features/product_detail/widget/product_image_widget.dart';
import 'package:softbenz_task/core/widgets/rating_widget.dart';
import 'package:softbenz_task/gen/assets.gen.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({super.key});

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  bool isWish = false;
  bool isContactSeller = false;
  ProductDetailEntity? productdetail;
  TextEditingController messageController = TextEditingController();
    NotificationServices services = NotificationServices();


  @override
  void initState() {
    final productdetail =
        context.read<ProductDetailCubit>().fetchProductDetail();
    if (productdetail is ProductDetailSuccessState) {
      isWish = productdetail.product.wished;
    }
     services.requestNotificationPermission();
    services.notificationInit();
    services.getDeviceToken().then((value) {
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ColorName.colorWhite,
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: BuildText(
            text: "Product Detail",
            fontSize: 20.hp,
            weight: FontWeight.w600,
            family: FontFamily.barlowSemiBold,
            color: ColorName.colorBlack,
          ),
          backgroundColor: ColorName.colorWhite,
          toolbarHeight: 70.hp,
          elevation: 0.8,
          scrolledUnderElevation: 0,
          shadowColor: ColorName.colorBackground,
          surfaceTintColor: ColorName.colorWhite,
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
              return _createProductDetailBody(state.product);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  _createProductDetailBody(ProductDetailEntity product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.hp,
          ),
          ProductImageWidget(images: product.images),
          SizedBox(
            height: 20.hp,
          ),
          _createProductDetail(product),
          SizedBox(
            height: 20.hp,
          ),
        ],
      ),
    );
  }

  _createProductDetail(ProductDetailEntity product) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.wp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createProductTitle(product),
            SizedBox(
              height: 16.hp,
            ),
            BuildText(
              text: "Code: ${product.colorVariants[0].productCode}",
              fontSize: 16.hp,
              family: FontFamily.barlowSemiBold,
              weight: FontWeight.w500,
              color: ColorName.colorBlack,
            ),
            RatingsWidget(rating: product.ratings),
            SizedBox(
              height: 8.hp,
            ),
            ProductPriceWidget(
              price: product.price,
              strikePrice: product.strikePrice,
              discount: product.offPercent,
            ),
            SizedBox(
              height: 10.hp,
            ),
            ProductColorVarient(
              colorVarient: product.colorVariants,
            ),
            SizedBox(
              height: 10.hp,
            ),
            ProductAddToCart(),
            SizedBox(
              height: 10.hp,
            ),
            ExpandableWidget(
              title: "Product Description",
              description: product.description,
            ),
            SizedBox(
              height: 10.hp,
            ),
            ExpandableWidget(
              title: "Product Ingredient",
              description: product.ingredient!,
            ),
            SizedBox(
              height: 10.hp,
            ),
            ExpandableWidget(
              title: "How to Use?",
              description: product.description,
            ),
            SizedBox(
              height: 10.hp,
            ),
            RatingInputWidget(),
            SizedBox(
              height: 10.hp,
            ),
            ContactSeller()
          ],
        ));
  }

  _createProductTitle(ProductDetailEntity product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              text: product.brand!.name!.toUpperCase(),
              fontSize: 16.hp,
              family: FontFamily.barlowSemiBold,
              weight: FontWeight.w600,
              color: ColorName.colorGrayText,
            ),
            SizedBox(
              height: 8.hp,
            ),
            BuildText(
              text: product.title!,
              fontSize: 18.hp,
              family: FontFamily.barlowMedium,
              weight: FontWeight.w500,
              color: ColorName.colorBlack,
            ),
          ],
        ),
        Spacer(),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              isWish = !isWish;
            });
          },
          child: isWish
              ? Assets.images.favouriteFilled.image(
                  height: 25.hp,
                  color: ColorName.colorPrimary,
                )
              : Assets.images.favourite.image(
                  height: 25.hp,
                  color: ColorName.colorPrimary,
                ),
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
