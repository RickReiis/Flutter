import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list/src/models/todo_model.dart';

class TodoRepository {
  final url = Uri.parse('https://jsonplaceholder.ir/users');

  Future<List<TodoModel>> fetchTodos() async {
    try {
      final response = await http.get(url);
      var json = jsonDecode(response.body);
      final list = json as List;
      return list.map((json) => TodoModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
