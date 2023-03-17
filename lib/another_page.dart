import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/counter_controller.dart';

class AnotherPage extends StatelessWidget {
  AnotherPage({Key? key}) : super(key: key);

  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.isEvenText)),
            Obx(() => Text(controller.count.string)),
            ElevatedButton(
                onPressed: () => controller.count.value++,
                child: const Text("ああああ"))
          ],
        ),
      ),
    );
  }
}
