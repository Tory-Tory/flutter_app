import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_app/models/users_list.dart';

abstract class ToDoListState {}

class ToDoListLoadingState extends ToDoListState {}

class ToDoListEmptyState extends ToDoListState {}

class ToDoListLoadedState extends ToDoListState {
  List<ToDoList> loadedToDoList;
  ToDoListLoadedState({required this.loadedToDoList}) : assert(loadedToDoList != null);
}

class ToDoListErrorState extends ToDoListState {}