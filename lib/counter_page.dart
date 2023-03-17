import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_sample/another_page.dart';
import 'package:getx_sample/controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);
  final counter = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(counter.count.string)),
            ElevatedButton(
                onPressed: () => counter.count.value++,
                child: const Text("増加")),
            Obx(() => Text(counter.countEven.string)),
            ElevatedButton(
                onPressed: () => Get.offAll(AnotherPage()),
                child: const Text("遷移"))
          ],
        ),
      ),
    );
  }
}
