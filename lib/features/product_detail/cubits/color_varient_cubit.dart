import 'package:flutter_bloc/flutter_bloc.dart';

class ColorVarientCubit extends Cubit<String> {
 ColorVarientCubit(String initialVarientId) : super(initialVarientId);

  void updateColor(String variantId) {
    emit(variantId);
  }
}