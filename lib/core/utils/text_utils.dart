import 'package:flutter/material.dart';
import 'package:softbenz_task/gen/colors.gen.dart';

extension Capitalize on String {
  String capitalize({bool allWords = true}) {
    if (isEmpty) {
      return this;
    }
    if (allWords) {
      final List<String> words = split(' ');
      final List<String> capitalized = <String>[];
      for (var w in words) {
        capitalized.add(w.capitalize(allWords: false));
      }
      return capitalized.join(' ');
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }
}

class BuildText extends StatelessWidget {
  const BuildText(
      {Key? key,
      this.text = "",
      this.fontSize,
      this.color = ColorName.colorLighterGrey,
      this.weight = FontWeight.w400,
      this.family,
      this.height = 1,
      this.decoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.overflow,
      this.italics = false})
      : super(key: key);

  final String text;
  final double? fontSize;
  final double height;
  final Color? color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool italics;
  final String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        height: height,
        color: color,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
        decoration: decoration,
        fontFamily: family,
      ),
    );
  }
}
