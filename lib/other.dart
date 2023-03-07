import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/count_controller.dart';
import 'other_second_page.dart';

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text(c.count.string)),
            ElevatedButton(
                onPressed: () => Get.snackbar("GetX Snakcbar", "ははははははははあはは",
                    snackPosition: SnackPosition.BOTTOM),
                child: const Text('スナックバー')),
            ElevatedButton(
              onPressed: () => Get.defaultDialog(
                  title: "GetX Alert",
                  middleText: "Simple GetX Alert",
                  textConfirm: 'Okay',
                  confirmTextColor: Colors.pink,
                  textCancel: "Cancel",
                  onConfirm: () => Get.back()),
              child: const Text("ダイアログ"),
            ),
            ElevatedButton(
                onPressed: () async {
                  var data = await Get.to(const OtherSecondPage());
                  if (data != null) {
                    c.change(data);
                  }
                },
                child: const Text("次の画面"))
          ],
        ),
      ),
    );
  }
}
