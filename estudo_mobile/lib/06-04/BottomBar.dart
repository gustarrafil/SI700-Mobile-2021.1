import 'package:flutter/material.dart';

import 'MainTela1.dart';
import 'MainTela2.dart';
import 'MainTela3.dart';

class BottomBar extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return BottomBarState();
    }
}

class BottomBarState extends State<BottomBar> {
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
