import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbenz_task/core/api/api_provider.dart';
import 'package:softbenz_task/core/injector/injection.dart';
import 'package:softbenz_task/features/product_detail/repository/product_detail_repository.dart';

class RepositoryWrapper extends StatelessWidget {
  final Widget child;
  const RepositoryWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          ProductDetailRepository(apiProvider: DI.instance<ApiProvider>()),
      child: child,
    );
  }
}
