import 'package:flutter/material.dart';
import 'MainTela1.dart';
import 'MainTela2.dart';
import 'MainTela3.dart';

class CriposeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Cripose"),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Arthur"),icon: Icon(Icons.account_box)),
                  Tab(text: "Gustavo", icon: Icon(Icons.account_box)),
                  Tab(icon: Icon(Icons.attach_money), child: Text("Cripose")),
                ],
              ),
            ),
            body: TabBarView(
              children: [MainAba1(), MainAba2(), MainAba3()],
            ),
          ),
        ));
  }
}
