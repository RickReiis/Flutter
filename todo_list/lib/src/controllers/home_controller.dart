import 'package:flutter/foundation.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class HomeController {
  final _repository = TodoRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  List<TodoModel> todos = [];

  Future start() async {
    state.value = HomeState.loading;
    print('ate aqui foi');

    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
      print('deu certo');
    } catch (e) {
      state.value = HomeState.error;
      print(e);
    }
    print('passou direto');
  }
}

enum HomeState { start, loading, success, error }
