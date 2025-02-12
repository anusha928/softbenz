import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/core/utils/color_utils.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/features/product_detail/cubits/color_varient_cubit.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductColorVarient extends StatelessWidget {
  final List<ColorVariantEntity> colorVarient;
  const ProductColorVarient({super.key, required this.colorVarient});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorVarientCubit, String>(
      builder: (context, selectedVarientId) {
        final selectedVariant = colorVarient.firstWhere(
          (item) => item.id == selectedVarientId,
          orElse: () => colorVarient.first,
        );

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
                    text: "(${selectedVariant.color!.name})",
                    style: TextStyle(
                      fontSize: 12.hp,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.barlowMedium,
                      color: ColorName.colorBlack,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.hp),
            Row(
              children: _createColorList(context, selectedVarientId),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _createColorList(
      BuildContext context, String selectedVarientId) {
    return List.generate(colorVarient.length, (index) {
      final color = hexToColor(colorVarient[index].color!.colorValue!.first);
      final isSelected = colorVarient[index].id! == selectedVarientId;

      return InkWell(
        onTap: () {
          context
              .read<ColorVarientCubit>()
              .updateColor(colorVarient[index].id!);
        },
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
