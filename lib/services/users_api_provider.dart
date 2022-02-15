import 'dart:convert';
import 'package:flutter_app/models/users_list.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  Future<List<Users>> getUsers() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => Users.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users list');
    }
  }
}
