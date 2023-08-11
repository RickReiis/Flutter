import 'dart:async';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ponto/src/controllers/ponto_controller.dart';
import 'package:ponto/src/models/ponto_model.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  final controler = PontoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: controler.painelPts,
          builder: ((context, child) {
            return Column(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: DropDownTextField(
                      dropDownList: meses,
                      listPadding: ListPadding(top: 1, bottom: 1),
                      initialValue: 'Janeiro',
                      onChanged: (value) => {controler.pontosMes(value.value)},
                    ),
                  ),
                ),
                height: 60,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controler.painelPts.value.length,
                    itemBuilder: (context, index) {
                      var linha = controler.painelPts.value;
                      var data = linha[index].data;
                      var pontos = linha[index].pontos;
                      return ListTile(
                          title: Row(
                            
                        children: [
                          Text(
                            "$data",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(pontos.toString(),
                              style: TextStyle(fontSize: 14))
                        ],
                      ));
                    }),
              )
            ]);
          })),
    );
  }

  List<DropDownValueModel> meses = [
    const DropDownValueModel(name: 'Janeiro', value: '1'),
    const DropDownValueModel(name: 'Fevereiro', value: '2'),
    const DropDownValueModel(name: 'Março', value: '3'),
    const DropDownValueModel(name: 'Abril', value: '4'),
    const DropDownValueModel(name: 'Maio', value: '5'),
    const DropDownValueModel(name: 'Junho', value: '6'),
    const DropDownValueModel(name: 'Julho', value: '7'),
    const DropDownValueModel(name: 'Agosto', value: '8'),
    const DropDownValueModel(name: 'Setembro', value: '9'),
    const DropDownValueModel(name: 'Outubro', value: '10'),
    const DropDownValueModel(name: 'Novembro', value: '11'),
    const DropDownValueModel(name: 'Dezembro', value: '12'),
  ];
}
