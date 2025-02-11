import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:softbenz_task/core/images/cache_manager.dart';
import 'package:softbenz_task/gen/assets.gen.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.fit,
    this.height,
    this.width,
    this.color,
    this.placeholderFit,
    this.alignment = Alignment.center,
    this.customPlaceHolder,
  });

  final String url;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? placeholderFit;
  final Alignment alignment;
  final Widget? customPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        height: height,
        width: width,
        color: color,
        alignment: alignment,
        cacheManager: CustomCacheManager.instance,
        errorWidget: (a, b, c) =>
            customPlaceHolder ?? Assets.images.fallback.image(),
        placeholder: (a, c) =>
            customPlaceHolder ?? Assets.images.fallback.image());
  }
}
