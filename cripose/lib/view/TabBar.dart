

import 'package:flutter/material.dart';
import '../view/TradeView.dart';
import '../controller/TabItem.dart';
import 'UserView.dart';
import 'TradeView.dart';
import 'HistoryView.dart';

class TabBarCripose extends StatelessWidget {
    TabBarCripose(BuildContext context);

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
                                TabItem("User", Icons.account_box),
                                TabItem("Trade", Icons.monetization_on_sharp),
                                TabItem("History", Icons.lock_clock),
                            ],
                        ),
                    ),
                    body: TabBarView(
                        children: [
                            UserView(),
                            TradeView(context),
                            HistoryView(),
                        ],
                    ),
                ),
            )
        );
    }
}

