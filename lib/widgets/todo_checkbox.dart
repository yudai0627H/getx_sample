import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/todo_controller.dart';

import '../models/todo.dart';

class TodoCheckbox extends StatelessWidget {
  final Todo todo;
  const TodoCheckbox(this.todo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.5,
        child: Checkbox(
            shape: const CircleBorder(),
            checkColor: Colors.transparent,
            activeColor: Colors.grey,
            side: BorderSide(
                width: 3, color: Theme.of(context).colorScheme.primary),
            value: todo.done,
            onChanged: (value) {
              // チェックボックスが押されたらTodoControllerを探してTodoを差し替え
              Get.find<TodoController>().updateDone(value!, todo);
            }));
  }
}
