import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/color_utils.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductColorVarient extends StatelessWidget {
  final List<ColorVariantEntity> colorVariants;
  final Function(int)? onTap;

  const ProductColorVarient({
    super.key,
    required this.colorVariants,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Color",
            style: TextStyle(
              fontSize: 14.hp,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.barlowMedium,
              color: ColorName.colorBlack,
            ),
            children: [
              TextSpan(
                text:
                    "(${colorVariants.firstWhere((e) => e.isSelected).color!.name!})",
                style: TextStyle(
                  fontSize: 12.hp,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.barlowMedium,
                  color: ColorName.colorBlack,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.hp),
        Row(
          children: _createColorList(context),
        ),
      ],
    );
  }

  List<Widget> _createColorList(BuildContext context) {
    return List.generate(colorVariants.length, (index) {
      final color = hexToColor(colorVariants[index].color!.colorValue!.first);
      final isSelected = colorVariants[index].isSelected;

      return InkWell(
        onTap: () => onTap!(index),
        splashColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.wp),
          height: 30.hp,
          width: 30.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isSelected ? ColorName.colorBlack : ColorName.colorWhite,
              width: 1.5,
            ),
            color: ColorName.colorWhite,
          ),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color,
              ),
            ),
          ),
        ),
      );
    });
  }
}
