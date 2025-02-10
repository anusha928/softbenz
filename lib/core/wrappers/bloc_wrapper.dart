import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/features/product_detail/cubits/product_detail_cubit.dart';
import 'package:softbenz_task/features/product_detail/repository/product_detail_repository.dart';

class BlocWrapper extends StatelessWidget {
  final Widget child;
  const BlocWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit(
        repository: context.read<ProductDetailRepository>(),
      ),
      child: child,
    );
  }
}
