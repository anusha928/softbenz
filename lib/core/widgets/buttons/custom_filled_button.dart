import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/gen/colors.gen.dart';

class CustomFilledButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Color? prefixColor;
  final Widget? suffixIcon;
  final Color? suffixColor;
  final String title;
  final TextStyle? titleStyle;
  final Color? fillColor;
  final VoidCallback? onPressed;
  final EdgeInsets? containerMargin;
  final EdgeInsets? containerPadding;
  final bool showShadow;
  final bool disabled;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color fontColor;
  final Color buttonColor;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.fillColor,
    this.prefixIcon,
    this.prefixColor,
    this.suffixIcon,
    this.suffixColor,
    this.onPressed,
    this.containerMargin,
    this.containerPadding,
    this.showShadow = true,
    this.disabled = false,
    this.buttonColor = ColorName.colorPrimary,
    required this.fontColor,
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: containerPadding ??
            EdgeInsets.symmetric(vertical: 8.hp, horizontal: 12.wp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: buttonColor),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Container(
                  padding: EdgeInsets.only(right: 10.wp), child: prefixIcon),
            BuildText(
                text: title,
                fontSize: fontSize,
                weight: fontWeight,
                family: fontFamily,
                color: fontColor),
            if (suffixIcon != null)
              Container(
                  padding: EdgeInsets.only(left: 10.wp), child: suffixIcon),
          ],
        ),
      ),
    );
  }
}
