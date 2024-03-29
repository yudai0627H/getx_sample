import 'package:get/get.dart';
import 'package:getx_sample/controllers/filter_controller.dart';

import '../models/todo.dart';

class TodoController extends GetxController {
  final _todos = <Todo>[].obs;

  List<Todo> get todos {
    final hideDone = Get.find<FilterController>().hideDone;
    return hideDone
        ? _todos.where((todo) => todo.done == false).toList()
        : _todos;
  }

  int get countUndone {
    return _todos.fold<int>(0, (acc, todo) {
      if (!todo.done) {
        acc++;
      }
      return acc;
    });
  }

  Todo? getTodoById(String id) {
    try {
      return _todos.singleWhere((e) => e.id == id);
    } on StateError {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
  }

  void addTodo(String description) {
    final todo = Todo(description: description);
    _todos.add(todo);
  }

  // Todoのテキスト更新
  void updateText(String description, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(description: description);
    _todos.setAll(index, [newTodo]);
  }

  // Todoの完了状況更新
  void updateDone(bool done, Todo todo) {
    final index = _todos.indexOf(todo);
    final newTodo = todo.copyWith(done: done);
    _todos.setAll(index, [newTodo]);
  }

  // 指定タスクを削除
  void remove(Todo todo) {
    _todos.remove(todo);
  }

  // 完了タスクを一括削除
  void deleteDone() {
    _todos.removeWhere((element) => element.done == true);
  }
}
