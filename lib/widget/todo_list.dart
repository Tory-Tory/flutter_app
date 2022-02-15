
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_list_bloc.dart';
import 'package:flutter_app/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDoListBloc, ToDoListState>(
      builder: (context, state) {
        if (state is ToDoListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ToDoListLoadedState) {
          return ListView.separated(
              itemCount: state.loadedToDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.white,
                  child: Center(
                      child: Text(state.loadedToDoList[index].title)
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
        }

        return SizedBox();
      },
    );
  }
}