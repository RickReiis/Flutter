import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ponto/src/models/ponto_model.dart';

main() {
  var json = {
    "data": "2022/12/16",
    "pontos": ["20:20", "12:30"]
  };
  test("Deve registrar ponto", () {
    var a = Ponto(data: "2022/12/16", pontos: ["20:20", "12:30"]).toJson();
    print(a['pontos'][0]);
  });
  test("Deve registrar ponto também", () {
    var a = Ponto.fromJson(json);
    print(a.pontos);
  });
  test("Timer", () {});
}
