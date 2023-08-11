import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:ponto/src/controllers/ponto_controller.dart';
import 'package:ponto/src/models/ponto_model.dart';

main() {
  var js = {
    "data": "2022/12/16",
    "pontos": ["20:20", "12:30"]
  };
  test("Controller", () {
    var control = PontoController();
    control.pontosMes(1);
  });
}
