//convert todo model in order to store in isar db

import 'package:isar/isar.dart';

import '../../domain/models/todo_model.dart';

part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  Todo toTodoModel() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  static IsarTodo toIsarTodoModel(Todo todo) {
    return IsarTodo()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
