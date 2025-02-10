import 'package:get_it/get_it.dart';
import 'package:softbenz_task/core/api/api_provider.dart';

class DI {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    instance.registerSingleton<ApiProvider>(
      ApiProvider(),
    );
  }
}
