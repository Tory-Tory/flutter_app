import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_app/models/users_list.dart';

abstract class ToDoListState {}

class ToDoListLoadingState extends ToDoListState {}

class ToDoListEmptyState extends ToDoListState {}

class ToDoListLoadedState extends ToDoListState {
  List<ToDoList> loadedToDoList;
  List<Users> loadedUsersList;
  ToDoListLoadedState({this.loadedToDoList, this.loadedUsersList}) : assert(loadedToDoList != null && loadedUsersList != null);
}

class ToDoListErrorState extends ToDoListState {}