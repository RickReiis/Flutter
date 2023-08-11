// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_controler.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                      child: Image.asset(
                    'assets/images/perfil.png',
                    fit: BoxFit.cover,
                  ))),
              accountName: Text('Rickson Reis'),
              accountEmail: Text('ricksonm11d21@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              subtitle: Text('Página Inicial!'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/home');
              }),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('1º desafio'),
              subtitle: Text('Desafio de layout!'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/desafio1');
              }),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              subtitle: Text('Encerrar sessão!'),
              onTap: (() {
                Navigator.of(context).pushReplacementNamed('/');
              }),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [Swt()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador: $contador'),
            Container(
              height: 10,
            ),
            Swt(),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            contador++;
          });
        },
      ),
    );
  }
}

class Swt extends StatelessWidget {
  const Swt({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppControler.instance.isDarkTheme,
      onChanged: (value) {
        AppControler.instance.changeTheme();
      },
    );
  }
}
