import 'package:flutter/material.dart';
import 'package:softbenz_task/core/injector/injection.dart';
import 'package:softbenz_task/core/wrappers/bloc_wrapper.dart';
import 'package:softbenz_task/core/wrappers/repository_wrapper.dart';
import 'package:softbenz_task/features/product_detail/page/product_detail_view.dart';
import 'package:softbenz_task/features/product_detail/widget/product_detail_body.dart';

void main() async {
  await DI.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryWrapper(
      child: BlocWrapper(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductDetailView(),
        ),
      ),
    );
  }
}
