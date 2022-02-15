
import 'package:flutter_app/bloc/todo_state.dart';
import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_app/models/users_list.dart';
import 'package:flutter_app/services/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/todo_events.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  final ToDoListRepository toDoListRepository;

  ToDoListBloc({required this.toDoListRepository})
      : super(ToDoListEmptyState()) {
    on<ToDoListEvent>((event, emit) async {
      if (event is ToDoListLoadEvent) {
        emit(ToDoListLoadingState());
        try {
          final List<ToDoList> _loadedToDoList = await toDoListRepository
              .getAllToDo();
          emit(ToDoListLoadedState(loadedToDoList: _loadedToDoList));
        } catch (_) {
          emit(ToDoListErrorState());
        }
      }
    });
  }
}