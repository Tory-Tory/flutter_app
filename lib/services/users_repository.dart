
import 'package:flutter_app/models/users_list.dart';
import 'package:flutter_app/services/users_api_provider.dart';

class UsersRepository {
  final UsersProvider _usersProvider = UsersProvider();
  Future<List<Users>> getAllUsers() => _usersProvider.getUsers();
}