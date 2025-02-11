import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_cubit.dart';
import 'package:softbenz_task/features/product_detail/repository/product_detail_repository.dart';
import 'package:softbenz_task/features/product_detail/widget/product_detail_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
          repository: context.read<ProductDetailRepository>()),
      child: const ProductDetailBody(),
    );
  }
}
