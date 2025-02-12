import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
