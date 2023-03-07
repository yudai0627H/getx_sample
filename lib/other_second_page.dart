import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherSecondPage extends StatelessWidget {
  const OtherSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: () => Get.back(), child: const Text("もどる"))
        ],
      ),
    );
  }
}
