import 'package:flutter/material.dart';
import 'MainTela1.dart';
import 'MainTela2.dart';
import 'MainTela3.dart';

class MyTabBarLayout extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(primarySwatch: Colors.deepPurple),
            home: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Scaffold(
                    appBar: AppBar(
                        title: Text("TabBarLayout"),
                        bottom: TabBar(
                            // isScrollable: true,
                            tabs: [
                            Tab(
                                child: Text("Primeira Tela"),
                                icon: Icon(Icons.access_alarm),
                            ),
                            Tab(text: "Segunda Tela", icon: Icon(Icons.account_box)),
                            Tab(icon: Icon(Icons.cake), child: Text("Terceira Tela")),
                            ],
                        ),
                    ),
                    body: TabBarView(
                        children: [MainTela1(), MainTela2(), MainTela3()],
                    ),
                ),
            )
        );
    }
}
