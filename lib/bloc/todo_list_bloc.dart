
import 'package:flutter_app/bloc/todo_state.dart';
import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_app/models/users_list.dart';
import 'package:flutter_app/services/todo_repository.dart';
import 'package:flutter_app/services/users_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/todo_events.dart';

class ToDoListBloc extends Bloc<ToDoListEvent, ToDoListState> {
  final ToDoListRepository toDoListRepository;
  final UsersRepository usersRepository;
  ToDoListBloc({this.toDoListRepository, this.usersRepository}) : assert(toDoListRepository != null && usersRepository != null);

  @override
  ToDoListState get initialState => ToDoListEmptyState();

  @override
  Stream<ToDoListState> mapEventToState(ToDoListEvent event) async* {
    if (event is ToDoListLoadEvent) {
      yield ToDoListLoadingState();
      try {
        final List<ToDoList> _loadedToDoList = await toDoListRepository.getAllToDo();
        final List<Users> _loadedUsersList = await usersRepository.getAllUsers();
        yield ToDoListLoadedState(loadedToDoList: _loadedToDoList, loadedUsersList: _loadedUsersList);
      } catch (_) {
        yield ToDoListErrorState();
      }
    }
  }
}
