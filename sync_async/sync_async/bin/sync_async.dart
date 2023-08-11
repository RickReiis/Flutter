import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<void> main() async {
  final todo = await fetch();
  print(todo.toJson());
}

Future<Todo> fetch() async {
  try {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var todo = Todo.fromJson(json);
    return todo;
  } catch (e) {
    throw Exception('Algo errado na url');
  }
}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo(
      {required this.title,
      required this.id,
      required this.userId,
      required this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(
        title: json['title'],
        id: json['id'],
        userId: json['userId'],
        completed: json['completed']);
  }
  Map toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'completed': completed};
  }
}
