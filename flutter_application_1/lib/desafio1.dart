import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Desafio1 extends StatefulWidget {
  const Desafio1({super.key});

  @override
  State<Desafio1> createState() => _Desafio1State();
}

class _Desafio1State extends State<Desafio1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 111, 111, 1),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 200,
          child: Image.asset('assets/images/tinder-logo-white.png'),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'Location Changer',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Plugin app for Tinder',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none),
        ),
        SizedBox(
          height: 50,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Login with Facebook',
                style: TextStyle(color: Color.fromRGBO(228, 111, 111, 1)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
            ))
      ]),
    );
  }
}
