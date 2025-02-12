import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:softbenz_task/core/injector/injection.dart';
import 'package:softbenz_task/core/services/notification_service.dart';
import 'package:softbenz_task/core/wrappers/bloc_wrapper.dart';
import 'package:softbenz_task/core/wrappers/repository_wrapper.dart';
import 'package:softbenz_task/features/product_detail/page/product_detail_view.dart';
import 'package:softbenz_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationService = NotificationServices();
  await notificationService.notificationInit();
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler() async {
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryWrapper(
      child: BlocWrapper(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
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
