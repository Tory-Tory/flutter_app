import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_events.dart';
import 'package:flutter_app/bloc/todo_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoListBloc toDoListBloc = BlocProvider.of<ToDoListBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            toDoListBloc.add(ToDoListLoadEvent());
          },
          color: Colors.black12,
        ),
      ],
    );
  }
}