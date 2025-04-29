import '../models/todo_model.dart';

abstract class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> updateTodo();
  Future<void> createTodo();
  Future<void> deleteTodo();
}
