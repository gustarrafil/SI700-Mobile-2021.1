import 'package:flutter/material.dart';

import 'tela1/tela1_main.dart';
import 'tela10/tela10_main.dart';
import 'tela11/tela11_main.dart';
import 'tela12/tela12_main.dart';
import 'tela13/tela13_main.dart';
import 'tela2/tela2_main.dart';
import 'tela3/tela3_main.dart';
import 'tela4/tela4_main.dart';
import 'tela5/tela5_main.dart';
import 'tela6/tela6_main.dart';
import 'tela7/tela7_main.dart';
import 'tela8/tela8_main.dart';
import 'tela9/tela9_main.dart';

class MyTabBarLayout extends StatelessWidget {
  final List<Widget> widgets = [
    MainTela1(),
    MainTela2(),
    MainTela3(),
    MainTela4(),
    MainTela5(),
    MainTela6(),
    MainTela7(),
    MainTela8(),
    MainTela9(),
    MainTela10(),
    MainTela11(),
    MainTela12(),
    MainTela13()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: DefaultTabController(
          length: 13,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text("TabBarLayout"),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Text("Primeira Tela"),
                      icon: Icon(Icons.access_alarm)),
                  Tab(
                      icon: Icon(Icons.account_box),
                      child: Text("Segunda Tela")),
                  Tab(icon: Icon(Icons.cake), child: Text("Terceira Tela")),
                  Tab(
                      icon: Icon(Icons.add_comment),
                      child: Text("Quarta Tela")),
                  Tab(child: Text("Quinta Tela"), icon: Icon(Icons.adb)),
                  Tab(child: Text("Sexta Tela"), icon: Icon(Icons.adb)),
                  Tab(child: Text("Sétima Tela"), icon: Icon(Icons.add_alert)),
                  Tab(child: Text("Oitava Tela"), icon: Icon(Icons.add_alert)),
                  Tab(child: Text("Nona Tela"), icon: Icon(Icons.add_comment)),
                  Tab(
                      child: Text("Décima Tela"),
                      icon: Icon(Icons.account_balance)),
                  Tab(
                      child: Text("Décima Primeira"),
                      icon: Icon(Icons.account_balance)),
                  Tab(
                      child: Text("Décima Segunda"),
                      icon: Icon(Icons.account_balance)),
                  Tab(
                      child: Text("Décima Terceira"),
                      icon: Icon(Icons.account_balance)),
                ],
              ),
            ),
            body: TabBarView(
              children: widgets,
            ),
          ),
        ));
  }
}
