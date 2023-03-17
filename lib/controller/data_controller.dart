import 'dart:math';

import 'package:get/get.dart';

import 'login_controller.dart';

class DataController extends GetxController with StateMixin<List<String>> {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    final random = Random().nextInt(10);
    change(null, status: RxStatus.loading());
    await wait(seconds: 2); // APIとの通信をモック

    if (random < 2) {
      change(null, status: RxStatus.error('Something is wrong.'));
    } else if (random < 4) {
      change(null, status: RxStatus.empty());
    } else {
      final data = [
        for (var i = 0; i < 100; i++) 'ABCDEGHIJKLMN',
      ];
      change(data, status: RxStatus.success());
    }
  }
}
