import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_app/bloc/todo_list_bloc.dart';
import 'package:flutter_app/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListWidget extends StatefulWidget {
  const ToDoListWidget({Key? key}) : super(key: key);

  @override
  State<ToDoListWidget> createState() => _ToDoListWidget();
}

class _ToDoListWidget extends State<ToDoListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListBloc, ToDoListState>(
      builder: (context, state) {
        if (state is ToDoListLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ToDoListLoadedState) {
          return ListView.builder(
            itemCount: state.loadedToDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(key: Key('${state.loadedToDoList[index]}'),
                child: Card(
                  child: CheckboxListTile(
                    title: Text(state.loadedToDoList[index].title),
                    value: state.loadedToDoList[index].completed,
                    onChanged: (bool? value) {
                      setState(() {
                        timeDilation = value! ? 10.0 : 1.0;
                      });
                    },
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
