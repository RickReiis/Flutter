import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:ponto/src/controllers/ponto_controller.dart';
import 'package:ponto/src/models/ponto_model.dart';
import 'package:ponto/src/pages/historico_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PontoController();
  late Timer timer;
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) async {
      controller.cargaDiaria();
      controller.painelPontos();
      controller.cargaSemanal();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Ponto'),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 60,
                      child: ElevatedButton(
                        onPressed: () => {
                          showBarModalBottomSheet(
                              context: context,
                              builder: (context) => Historico())
                        },
                        child: Center(
                          child: Icon(Icons.menu),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 190, 190, 190)),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Carga Horária da Semana:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        controller.cSemana.value,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Pontos de Hoje:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        constraints:
                            BoxConstraints(minWidth: 100, maxWidth: 200),
                        child: Text(
                          controller.state.value,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Carga Horária de Hoje:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        controller.cDia.value,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () => {controller.addPonto(DateTime.now())},
                        child: Text('PONTO'))),
              ],
            ),
          );
        },
      ),
    );
  }
}
