import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_list_bloc.dart';
import 'package:flutter_app/services/todo_repository.dart';
import 'package:flutter_app/widget/action_button.dart';
import 'package:flutter_app/widget/todo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final toDoListRepository = ToDoListRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoListBloc(toDoListRepository: toDoListRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('TO DO'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            const Expanded(child: ToDoListWidget()),
          ],
        ),
      ),
    );
  }

}