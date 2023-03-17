import 'package:get/get.dart';

class CounterController extends GetxController {
  final count = 0.obs;
  final countEven = 0.obs;
  late final Worker _worker;

  String get isEvenText => count.isEven ? "Even" : "Odd";

  @override
  void onInit() {
    super.onInit();
    _worker = ever<int>(
        count,
        (value) => {
              if (value.isEven) {countEven.value = value}
            });
  }

  @override
  void onClose() {
    _worker.dispose();
    super.onClose();
  }
}
