 import 'package:flutter/material.dart';

Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", ""); 
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; 
    }
    return Color(int.parse(hexColor, radix: 16));
  }