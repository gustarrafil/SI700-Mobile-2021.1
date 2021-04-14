import 'package:aula_flutter/13-04/MainTela4.dart';
import 'package:flutter/material.dart';
import 'package:aula_flutter/13-04/MainTela1.dart';
import 'package:aula_flutter/13-04/MainTela2.dart';
import 'package:aula_flutter/13-04/MainTela3.dart';

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
              title: Text("Cripose"),
              bottom: TabBar(
                  isScrollable: true,
                tabs: [
                  Tab(child: Text("Arthur"),icon: Icon(Icons.account_box)),
                  Tab(text: "Gustavo", icon: Icon(Icons.account_box)),
                  Tab(icon: Icon(Icons.attach_money), child: Text("Cripose")),
                  Tab(icon: Icon(Icons.add_comment), child: Text("quarta tela")),
                ],
              ),
            ),
            body: TabBarView(
              children: [MainTela1(), MainTela2(), MainTela3(), MainTela4()],
            ),
          ),
        ));
  }
}
