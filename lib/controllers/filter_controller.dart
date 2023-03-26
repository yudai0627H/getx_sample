import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxBool _hideDone = false.obs;
  bool get hideDone => _hideDone.value;

  void toggleHide() {
    _hideDone.toggle();
  }
}
