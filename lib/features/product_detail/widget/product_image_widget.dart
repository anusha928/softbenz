import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';

class ProductImageWidget extends StatelessWidget {
  final List<String> images;
  const ProductImageWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              height: 40.h,
              aspectRatio: 1.2,
              enlargeCenterPage: true,
              viewportFraction: 0.78,
              enlargeFactor: 0.19,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            items: images
                .map(
                  (image) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList()),
      ],
    );
  }
}
