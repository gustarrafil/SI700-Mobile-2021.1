import 'package:flutter/material.dart';

import 'tela1.dart';
import 'tela2.dart';
import 'tela3.dart';

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
                            Tab(child: Text("User"),icon: Icon(Icons.access_alarm),),
                            Tab(text: "Trade", icon: Icon(Icons.account_box)),
                            Tab(icon: Icon(Icons.cake), child: Text("History")),
                            ],
                        ),
                    ),
                    body: TabBarView(
                        children: [Tela1(), Tela2(), Tela3()],
                    ),
                ),
            )
        );
    }
}