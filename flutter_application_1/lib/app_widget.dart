// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_controler.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'desafio1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppControler.instance,
        builder: (BuildContext context, child) {
          return MaterialApp(
            theme: ThemeData(
              brightness: AppControler.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => LoginPage(),
              '/home': (context) => HomePage(),
              '/desafio1': (context) => Desafio1(),
            },
          );
        });
  }
}
