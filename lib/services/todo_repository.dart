
import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_app/services/todo_api_provider.dart';

class ToDoListRepository {
  final ToDoProvider _toDoProvider = ToDoProvider();
  Future<List<ToDoList>> getAllToDo() => _toDoProvider.getToDoList();
}