import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductPriceWidget extends StatelessWidget {
  final int price;
  final int strikePrice;
  final int discount;
  const ProductPriceWidget(
      {super.key,
      required this.price,
      required this.strikePrice,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildText(
          text: "Rs. $price",
          fontSize: 16.hp,
          family: FontFamily.barlowSemiBold,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
        ),
        SizedBox(
          width: 10.wp,
        ),
        BuildText(
          text: "Rs. $strikePrice",
          fontSize: 16.hp,
          family: FontFamily.barlowSemiBold,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
          decoration: TextDecoration.lineThrough,
        ),
        SizedBox(
          width: 10.wp,
        ),
        CustomFilledButton(
          title: "$discount% off",
          fontColor: ColorName.colorPrimary,
          fontFamily: FontFamily.barlowSemiBold,
          containerPadding:
              EdgeInsets.symmetric(vertical: 6.hp, horizontal: 10.wp),
          borderColor: ColorName.colorPrimary,
          fontSize: 14.hp,
          fontWeight: FontWeight.w600,
          buttonColor: ColorName.colorWhite,
        )
      ],
    );
  }
}
