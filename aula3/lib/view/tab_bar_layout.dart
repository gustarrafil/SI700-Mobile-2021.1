import 'package:aula3/view/tela1/tela1_main.dart';
import 'package:aula3/view/tela2/tela2_main.dart';
import 'package:aula3/view/tela3/tela3_main.dart';
import 'package:aula3/view/tela4/tela4_main.dart';
import 'package:aula3/view/tela5/tela5_main.dart';
import 'package:aula3/view/tela6/tela6_main.dart';
import 'package:aula3/view/tela7/tela7_main.dart';
import 'package:aula3/view/tela8/tela8_main.dart';
import 'package:flutter/material.dart';

class MyTabBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text("TabBarLayout"),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Primeira Tela", icon: Icon(Icons.access_alarm)),
                  Tab(text: "Segunda Tela", icon: Icon(Icons.account_box)),
                  Tab(text: "Terceira Tela", icon: Icon(Icons.cake)),
                  Tab(text: "Quarta Tela", icon: Icon(Icons.account_box)),
                  Tab(text: "Quinta Tela", icon: Icon(Icons.android)),
                  Tab(text: "Sexta Tela", icon: Icon(Icons.android)),
                  Tab(text: "Setima Tela", icon: Icon(Icons.add_a_photo)),
                  Tab(text: "Oitava Tela", icon: Icon(Icons.add_a_photo)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                // Telas centrais nas pastas
                MainTela1(),
                MainTela2(),
                MainTela3(),
                MainTela4(),
                MainTela5(),
                MainTela6(),
                MainTela7(),
                MainTela8(),
              ],
            ),
          ),
        ));
  }
}
