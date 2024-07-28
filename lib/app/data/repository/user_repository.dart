import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/helper.dart';
import '../entities/users.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl$userEndpoint'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> fetchUser(int id) async {
    final response = await http.get(Uri.parse('$baseUrl$userEndpoint/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl$userEndpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create user');
    }
  }

  Future<void> updateUser(User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl$userEndpoint/${user.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl$userEndpoint/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
