import 'dart:convert';

import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String description;
  final bool done;

  Todo({required this.description, this.done = false})
      : id = DateTime.now().microsecondsSinceEpoch.toString();

  const Todo.withId(
      {required this.id, required this.description, this.done = false});

  static const initialTodos = [
    Todo.withId(id: "0", description: "犬の散歩", done: true),
    Todo.withId(id: "1", description: '学校の宿題\n- 国語\n- 算数\n- 英語'),
    Todo.withId(id: "2", description: "夏休みの計画"),
  ];

  Todo copyWith({
    String? id,
    String? description,
    bool? done,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      description: description ?? this.description,
      done: done ?? this.done,
    );
  }

  factory Todo.fromJson(String json) {
    // JSON文字列をTodoに
    final mapData = jsonDecode(json);
    return Todo.withId(
      id: mapData['id'] as String, // ダウンキャスト
      description: mapData['text'] as String,
      done: mapData['done'] as bool,
    );
  }

  String toJson() {
    // TodoをJSON文字列に
    return jsonEncode({
      'id': id,
      'text': description,
      'done': done,
    });
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Todo && other.id == id; // IDが同じなら等価
  }

  @override
  int get hashCode =>
      Object.hash(id.hashCode, description.hashCode, done.hashCode);
}
