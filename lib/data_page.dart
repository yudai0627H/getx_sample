import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/data_controller.dart';

class DataPage extends StatelessWidget {
  DataPage({Key? key}) : super(key: key);

  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Page'),
      ),
      body: Center(
        child: controller.obx(
          (data) {
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(data[index]));
                });
          },
          onError: (error) {
            return Text(
              error!,
              style: const TextStyle(color: Colors.red),
            );
          },
          onEmpty: const Text("no data"),
          onLoading: const CircularProgressIndicator.adaptive(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.init,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
