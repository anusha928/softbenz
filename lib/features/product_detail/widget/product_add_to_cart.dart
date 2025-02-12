import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/core/utils/size_utils.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';
import 'package:softbenz_task/core/widgets/buttons/custom_filled_button.dart';
import 'package:softbenz_task/features/product_detail/cubits/counter_cubit.dart';
import 'package:softbenz_task/gen/colors.gen.dart';
import 'package:softbenz_task/gen/fonts.gen.dart';

class ProductAddToCart extends StatelessWidget {
  const ProductAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: "Select Quantity",
          fontSize: 16.hp,
          family: FontFamily.barlowMedium,
          weight: FontWeight.w500,
          color: ColorName.colorBlack,
        ),
        SizedBox(
          height: 8.hp,
        ),
        Container(
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: ColorName.colorPrimary,
            ),
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      createButton(
                          ontap: state == 1
                              ? null
                              : () => context.read<CounterCubit>().decrement(),
                          Icon(
                            Icons.remove,
                            size: 16,
                            color: state == 1
                                ? ColorName.colorLighterGrey
                                : ColorName.colorWhite,
                          )),
                      Container(
                        width: 0.8,
                        height: 36.hp,
                        color: ColorName.colorWhite,
                      ),
                      createButton(
                        Text(
                          "$state",
                          style: TextStyle(color: ColorName.colorWhite),
                        ),
                      ),
                      Container(
                        width: 0.8,
                        height: 36.hp,
                        color: ColorName.colorWhite,
                      ),
                      createButton(
                          ontap: () => context.read<CounterCubit>().increment(),
                          Icon(
                            Icons.add,
                            color: ColorName.colorWhite,
                            size: 16,
                          ))
                    ]);
              },
            )),
        SizedBox(
          height: 18.hp,
        ),
        CustomFilledButton(
          title: "Add To Cart",
          fontColor: ColorName.colorWhite,
          fontFamily: FontFamily.barlowBold,
          containerPadding:
              EdgeInsets.symmetric(vertical: 12.hp, horizontal: 10.wp),
          borderColor: ColorName.colorWhite,
          fontSize: 14.hp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  createButton(Widget child, {Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.wp, vertical: 6.hp),
        child: Center(child: child),
      ),
    );
  }
}
