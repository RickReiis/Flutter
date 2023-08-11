import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:ponto/src/models/ponto_model.dart';
import 'package:ponto/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PontoController {
  final state = ValueNotifier<String>("");
  final cDia = ValueNotifier<String>("");
  final cSemana = ValueNotifier<String>("");
  final painelPts = ValueNotifier<List<Ponto>>([]);

  setPonto(time, modelo) async {
    var data = DateFormat.yMd().format(time);
    var chave = "PONTOS:$data";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(chave, modelo);
  }

  getPonto(time) async {
    var data = DateFormat.yMd().format(time);
    var chave = "PONTOS:$data";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pontos = prefs.getString(chave);

    return pontos;
  }

  limpar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    state.value = "";
    cDia.value = "";
    cSemana.value = "";
    print("Limkpo");
  }

  addPonto(atual) async {
    var data = DateFormat.yMd().format(atual);
    var ponto = DateFormat.Hm().format(atual);
    List<String> pontos = [];
    pontos.add("${ponto}h");
    var modelo = json.encode(Ponto(data: data, pontos: pontos).toJson());
    String? linha = await getPonto(atual);

    if (linha == null) {
      await setPonto(atual, modelo);
    } else {
      var modelo2 = Ponto.fromJson(json.decode(linha));
      pontos.clear();
      pontos.addAll(modelo2.pontos as List<String>);
      pontos.add("${ponto}h");
      modelo = json.encode(Ponto(data: data, pontos: pontos).toJson());
      await setPonto(atual, modelo);
    }
  }

  intervalo(incio, fim) {
    Duration difference = incio.difference(fim);
    var segundos = difference.inSeconds;
    segundos < 0 ? segundos = segundos * (-1) : segundos = segundos;
    return segundos;
  }

  DateTime returData(String data, String ponto) {
    var date = [];
    var time = [];
    var date2 = [];
    var time2 = [];

    date = data.split("/");

    for (var i = 0; i < date.length; i++) {
      date2.add(int.parse(date[i]));
    }

    ponto = ponto.replaceAll("h", "");
    time = ponto.split(":");

    for (var i = 0; i < time.length; i++) {
      time2.add(int.parse(time[i]));
    }

    var datetime =
        DateTime(date2[2], date2[0], date2[1], time2[0], time2[1], 0);

    return datetime;
  }

  durationInDate(Duration duration) {
    var sec = duration.inSeconds - (duration.inMinutes * 60);
    var min = duration.inMinutes - (duration.inHours * 60);
    var hour = duration.inHours - (duration.inDays * 24);
    var day = duration.inDays;
    return DateTime(0, 0, day, hour, min, sec, 0, 0);
  }

  pontoLength(date) async {
    var get = await getPonto(date);
    if (get == null) {
      return 0;
    } else {
      var modelo = Ponto.fromJson(json.decode(get));
      List<String> lista = [];
      lista.addAll(modelo.pontos as List<String>);
      var intervalos = [];
      var data = modelo.data.toString();

      for (var i = 0; i < lista.length; i = i + 2) {
        if (i + 1 <= lista.length - 1) {
          var diferenca = intervalo(
              returData(data, lista[i]), returData(data, lista[i + 1]));
          intervalos.add(diferenca);
        } else {
          var diferenca = intervalo(returData(data, lista[i]), DateTime.now());
          intervalos.add(diferenca);
        }
      }

      var carga = 0;
      intervalos.forEach((element) {
        carga = carga + int.parse(element.toString());
      });
      return carga;
    }
  }

  cargaDiaria() async {
    var carga = await pontoLength(DateTime.now());
    cDia.value =
        DateFormat.Hms().format(durationInDate(Duration(seconds: carga)));
  }

  cargaSemanal() async {
    var data = DateTime.now();
    var cargas = await pontoLength(data) * 0;
    while (data.weekday != DateTime.sunday) {
      cargas += await pontoLength(data);
      data = data.subtract(Duration(days: 1));
    }
    cSemana.value =
        DateFormat.Hms().format(durationInDate(Duration(seconds: cargas)));
  }

  painelPontos() async {
    var get = await getPonto(DateTime.now());
    if (get != null) {
      var modelo = Ponto.fromJson(json.decode(get));
      List<String> pontos = [];
      pontos.clear();
      pontos.addAll(modelo.pontos as List<String>);
      state.value = pontos.join(" - ");
    } else {
      state.value = "";
    }
  }

  pontosMes(mes) async {
    mes = int.parse(mes);
    DateTime data;
    var ano = DateTime.now().year;
    var newData = DateTime(ano, mes, 25);
    mes != 1 ? ano = ano : ano--;
    mes != 1 ? mes-- : mes = 12;
    data = DateTime(ano, mes, 25);
    var get;
    List<Ponto> lista = [];
    while (data != newData) {
      List<String> pontos = [];
      data = data.add(Duration(days: 1));
      get = await getPonto(data);
      var painel = data.day.toString() +
          "/" +
          data.month.toString() +
          "/" +
          data.year.toString();

      if (get != null) {
        var modelo = Ponto.fromJson(json.decode(get));
        print(painel);
        print(modelo.pontos);
        pontos.add(modelo.pontos.toString());
      } else {
        print(painel);
        print("Sem ponto");
        pontos.add("");
      }
      lista.add(Ponto(data: painel, pontos: pontos));
    }
    painelPts.value = lista;
    print(painelPts.value);
  }
}
