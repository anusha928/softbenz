import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class RatingsWidget extends StatelessWidget {
  final int rating;
  const RatingsWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildText(
          text: "Rating",
          fontSize: 16.hp,
          family: FontFamily.barlowMedium,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
        ),
        SizedBox(
          width: 10.wp,
        ),
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemPadding: EdgeInsets.symmetric(vertical: 6.hp, horizontal: 4.wp),
          itemCount: 5,
          unratedColor: ColorName.colorLightestGrey,
          itemSize: 18.hp,
          direction: Axis.horizontal,
        ),
      ],
    );
  }
}

class RatingInputWidget extends StatefulWidget {
  const RatingInputWidget({super.key});

  @override
  State<RatingInputWidget> createState() => _RatingInputWidgetState();
}

class _RatingInputWidgetState extends State<RatingInputWidget> {
  double _currentRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: "Give Your Rating",
          fontSize: 16.hp,
          family: FontFamily.barlowMedium,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
        ),
        SizedBox(height: 8.hp),
        RatingBar(
          initialRating: _currentRating,
          minRating: 1,
          maxRating: 5,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 24.hp,
          ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Colors.amber),
            half: Icon(Icons.star_half, color: Colors.amber),
            empty: Icon(Icons.star_border, color: ColorName.colorLightestGrey),
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _currentRating = rating;
            });
          },
        ),
      ],
    );
  }
}
