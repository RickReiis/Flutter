import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:conversor/app/controllers/home_controller.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);
  test('Deve converter de Real para Dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText.text, '0.38');
  });
  test('Deve converter de Dolar para Real com vírgula', () {
    toText.text = '1,0';
    homeController.toCurrency = CurrencyModel(
        name: 'Dolar',
        real: 5.30,
        dolar: 1.0,
        euro: 1,
        bitcoin: 0.000051371318827599995);
    homeController.fromCurrency = CurrencyModel(
        name: 'Real',
        real: 1.0,
        dolar: 0.19,
        euro: 0.19,
        bitcoin: 0.000009666320172329159);
    homeController.convert();
    expect(fromText.text, '5.30');
  });
}
