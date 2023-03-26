import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/locale_controller.dart';
import 'package:getx_sample/controllers/theme_controller.dart';
import 'package:getx_sample/controllers/todo_controller.dart';

import '../controllers/filter_controller.dart';
import '../widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final todoController = Get.put(TodoController());
  final filterController = Get.put(FilterController());
  final localeController = Get.find<LocaleController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() => Text('タイトル' ' (${todoController.countUndone})')),
        leading: IconButton(
          icon: Obx(() => Icon(filterController.hideDone
              ? Icons.filter_alt
              : Icons.filter_alt_outlined)),
          onPressed: filterController.toggleHide,
        ),
        actions: [
          IconButton(
              onPressed: () => localeController.changeLocale(),
              icon: const Icon(Icons.language)),
          IconButton(
              onPressed: themeController.changeTheme,
              icon: const Icon(Icons.color_lens))
        ],
      ),
      body: TodoList(),
    );
  }
}
