import 'package:cripose/bloc/logic/manage_db/manage_db_state.dart';
import 'package:cripose/bloc/logic/manage_db/manage_local_db_bloc.dart';
import 'package:cripose/bloc/logic/monitor_db/monitor_db_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/TradeView.dart';
import '../bloc/component/TabItem.dart';
import 'UserView.dart';
import 'TradeView.dart';
import 'HistoryView.dart';

class TabBarCripose extends StatefulWidget {
  TabBarCripose(BuildContext context);

  @override
  _TabBarCriposeState createState() => _TabBarCriposeState();
}

class _TabBarCriposeState extends State<TabBarCripose> {

    // ADAPTAR BLOCPROVIDER COM MENU EMBAIXO PRA MENU EM CIMA
    
    @override
    Widget build(BuildContext context) {
        var _pages = [
            TabItem("User", Icons.account_box), 
            TabItem("Trade", Icons.monetization_on_outlined), 
            TabItem("History", Icons.history)
        ];
        return MaterialApp(
            title: 'Cripose',
            home: MultiBlocProvider(
                providers: [
                    BlocProvider(create: (_) => MonitorBloc()),
                    BlocProvider(create: (_) => ManageLocalBloc())
                ],
                child: BlocListener<ManageLocalBloc, ManageState>(
                    listener: (context, state) {
                        // if (state is UpdateState) {
                        //     setState(() {
                        //         _currentPage = 1;
                        //     });
                        // }
                    },

                    child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Scaffold(
                            resizeToAvoidBottomInset: false,
                            appBar: AppBar(
                                backgroundColor: Colors.blueGrey[900],
                                title: Text("Cripose"),
                                bottom: TabBar(
                                    tabs: _pages,
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
                ),
            ),
        );



    // return MaterialApp(
    //     home: DefaultTabController(
    //         length: 3,
    //         initialIndex: 0,
    //         child: Scaffold(
    //             resizeToAvoidBottomInset: false,
    //             appBar: AppBar(
    //                 backgroundColor: Colors.blueGrey[900],
    //                 title: Text("Cripose"),
    //                 bottom: TabBar(
    //                     tabs: [
    //                         TabItem("User", Icons.account_box),
    //                         TabItem("Trade", Icons.monetization_on_outlined),
    //                         TabItem("History", Icons.history),
    //                     ],
    //                 ),
    //             ),
    //             body: TabBarView(
    //                 children: [
    //                     UserView(),
    //                     TradeView(context),
    //                     HistoryView(),
    //                 ],
    //             ),
    //         ),
    //     )
    // );
  }
}

