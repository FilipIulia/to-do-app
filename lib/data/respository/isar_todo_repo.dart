import 'package:isar/isar.dart';
import 'package:todoapp/data/models/isar_todo.dart';
import 'package:todoapp/domain/models/todo_model.dart';
import 'package:todoapp/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<void> createTodo(Todo newTodo) async {
    final todoIsar = IsarTodo.toIsarTodoModel(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return db.writeTxn(() => db.todoIsars.delete(todo.id));
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toTodoModel()).toList();
    //throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoIsar = IsarTodo.toIsarTodoModel(todo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
}
