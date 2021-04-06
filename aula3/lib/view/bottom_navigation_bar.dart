import 'package:aula3/view/tela1/tela1_main.dart';
import 'package:aula3/view/tela2/tela2_main.dart';
import 'package:aula3/view/tela3/tela3_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavigationBarState();
  }
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentPage = 0;

  List<Widget> _pages = [
    MainTela1(),
    MainTela2(),
    MainTela3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation bar"),
        ),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.cake), title: Text("Tela 1")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Tela 2")),
            BottomNavigationBarItem(
                icon: Icon(Icons.zoom_in), title: Text("Tela 2")),
          ],
          currentIndex: _currentPage,
          // Funcao anonima que usa outra funcao gatilho como parametro para mudar a tela
          onTap: (int index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
