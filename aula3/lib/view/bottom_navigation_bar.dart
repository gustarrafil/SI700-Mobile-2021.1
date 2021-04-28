import 'package:flutter/material.dart';

import 'tela1/tela1_main.dart';
import 'tela2/tela2_main.dart';
import 'tela3/tela3_main.dart';

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
            title: Text("BottomNavigationBar"),
          ),
          body: _pages[_currentPage],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.cake), label: "Tela 1"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_photo_alternate), label: "Tela 2"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_drop_up), label: "Tela 3")
            ],
            fixedColor: Colors.red,
            currentIndex: _currentPage,
            onTap: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ));
  }
}
