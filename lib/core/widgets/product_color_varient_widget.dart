import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/color_utils.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/features/product_detail/entity/color_variant_entity.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductColorVarient extends StatefulWidget {
  final List<ColorVariantEntity> colorVarient;
  const ProductColorVarient({super.key, required this.colorVarient});

  @override
  State<ProductColorVarient> createState() => _ProductColorVarientState();
}

class _ProductColorVarientState extends State<ProductColorVarient> {
  late String colorName;
  late String varientId;
  late List<String> colorList = [];

  @override
  void initState() {
    getColorName();
    super.initState();
  }

  getColorName() {
    for (ColorVariantEntity items in widget.colorVarient) {
      if (items.isSelected == true) {
        colorName = items.color!.name!;
        varientId = items.id!;
      }
      colorList.add(items.color!.colorValue!.first);
    }
  }

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
                    color: ColorName.colorBlack),
                children: [
              TextSpan(
                text: "($colorName)",
                style: TextStyle(
                    fontSize: 12.hp,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.barlowMedium,
                    color: ColorName.colorBlack),
              )
            ])),
        SizedBox(
          height: 8.hp,
        ),
        Row(
          children: _createColorList(),
        )
      ],
    );
  }

  _createColorList() {
    return List.generate(widget.colorVarient.length, (index) {
      final color = hexToColor(colorList[index]);
      return InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.wp),
          height: 30.hp,
          width: 30.hp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: widget.colorVarient[index].id! == varientId
                      ? ColorName.colorBlack
                      : ColorName.colorWhite,
                  width: 1.5),
              color: ColorName.colorWhite),
          child: Padding(
            padding: EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: color),
            ),
          ),
        ),
      );
    });
  }
}
