import 'package:flutter/material.dart';

import 'tela1.dart';
import 'tela2.dart';
import 'tela3.dart';

class TabBarCripose extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            // colocar tema preto com icones amarelos?
            home: DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                        title: Text("Cripose"),
                        bottom: TabBar(
                            tabs: [
                                Tab(icon: Icon(Icons.account_box),text: "User"),
                                Tab(icon: Icon(Icons.arrow_drop_down_outlined),text: "Trade"),
                                Tab(icon: Icon(Icons.lock_clock),text: "History"),
                            ],
                        ),
                    ),
                    body: TabBarView(
                        children: [TelaUser(), TelaTrade(), TelaHistory()],
                    ),
                ),
            )
        );
    }
}