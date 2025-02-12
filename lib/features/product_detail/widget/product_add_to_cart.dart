import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductAddToCart extends StatefulWidget {
  const ProductAddToCart({super.key});

  @override
  State<ProductAddToCart> createState() => _ProductAddToCartState();
}

class _ProductAddToCartState extends State<ProductAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: "Select Quantity",
          fontSize: 16.hp,
          family: FontFamily.barlowMedium,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
        ),
        SizedBox(
          height: 8.hp,
        ),
        Container(
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorName.colorPrimary,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  createButton(Icon(
                    Icons.remove,
                    size: 16,
                    color: ColorName.colorWhite,
                  )),
                  Container(
                    width: 0.8,
                    height: 36.hp,
                    color: ColorName.colorWhite,
                  ),
                  createButton(
                    Text(
                      "1",
                      style: TextStyle(color: ColorName.colorWhite),
                    ),
                  ),
                  Container(
                    width: 0.8,
                    height: 36.hp,
                    color: ColorName.colorWhite,
                  ),
                  createButton(Icon(
                    Icons.add,
                    color: ColorName.colorWhite,
                    size: 16,
                  ))
                ])),
        SizedBox(
          height: 18.hp,
        ),
        CustomFilledButton(
          title: "Add To Cart",
          fontColor: ColorName.colorWhite,
          fontFamily: FontFamily.barlowBold,
          containerPadding:
              EdgeInsets.symmetric(vertical: 12.hp, horizontal: 10.wp),
          borderColor: ColorName.colorWhite,
          fontSize: 14.hp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  createButton(Widget child) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.wp, vertical: 6.hp),
        child: Center(child: child),
      ),
    );
  }
}
