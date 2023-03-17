import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/todo_controller.dart';

import '../widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("タイトル（仮）"),
        leading: IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.language)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.color_lens))
        ],
      ),
      body: TodoList(),
    );
  }
}
