import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/widgets/action_button.dart';

import '../controllers/todo_controller.dart';
import '../models/todo.dart';

class AddTodoPage extends StatefulWidget {
  final String? todoId;
  const AddTodoPage({Key? key, this.todoId}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoController = Get.find<TodoController>();
  final textController = TextEditingController();

  Todo? todo;

  @override
  void initState() {
    super.initState();
    if (widget.todoId != null) {
      todo = todoController.getTodoById(widget.todoId!);
      if (todo != null) {
        // 該当タスクがあった場合TextFieldにdescription表示
        textController.text = todo!.description;
      } else {
        // TODO: 該当するタスクがない場合はHomePageへ
      }
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("id: ${(todo?.id ?? "新規タスク")}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                TextField(
                  controller: textController,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: "タスク入力",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  style: const TextStyle(fontSize: 25),
                  maxLines: null,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  label: "キャンセル",
                  icon: Icons.cancel,
                  color: Colors.grey,
                  onPressed: () {
                    // TODO:ブラウザから直接アクセスした場合に対応
                    Get.back();
                  },
                ),
                ActionButton(
                  label: todo == null ? "追加" : "更新",
                  icon: Icons.check,
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    final text = textController.text;
                    if (todo == null && text.isNotEmpty) {
                      todoController.addTodo(text); // 新規追加
                    } else if (todo != null) {
                      todoController.updateText(text, todo!); // 既存更新
                    }
                    // TODO:　ブラウザから直接アクセスした場合
                    Get.back();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
