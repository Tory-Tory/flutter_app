import 'dart:convert';
import 'package:flutter_app/models/todo_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ToDoProvider {
  Future<List<ToDoList>> getToDoList() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> toDoJson = json.decode(response.body);
      return toDoJson.map((json) => ToDoList.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todo list');
    }
  }
}
