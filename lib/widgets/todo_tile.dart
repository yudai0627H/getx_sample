import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controllers/todo_controller.dart';
import 'package:getx_sample/widgets/todo_checkbox.dart';

import '../models/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed('/todo?id=${todo.id}');
      },
      leading: TodoCheckbox(todo),
      title: Text(
        todo.description,
        style: todo.done
            ? const TextStyle(
                color: Colors.grey,
                fontSize: 30,
                decoration: TextDecoration.lineThrough)
            : const TextStyle(fontSize: 30),
      ),
      trailing: IconButton(
        onPressed: () {
          Get.find<TodoController>().remove(todo);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
