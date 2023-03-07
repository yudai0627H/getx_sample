import 'package:get/get.dart';

class Controller extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
  // void increment() {
  //   count++;
  //
  //   print(count);
  // }
}
