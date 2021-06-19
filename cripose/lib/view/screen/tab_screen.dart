import 'package:cripose/logic/auth_bloc.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/view/form/buy_form.dart';
import 'package:cripose/view/form/sell_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabView extends StatefulWidget {
  TabView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box)),
                Tab(icon: Icon(Icons.monetization_on_outlined)),
                Tab(icon: Icon(Icons.history)),
              ],
            ),
            actions: [
              TextButton.icon(
                  style: TextButton.styleFrom(primary: Colors.white),
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  label: Text("Logout"))
            ],
            title: Text(widget.title),
          ),
          body: TabBarView(children: [
            Container(child: BlocBuilder<MonitorBloc, MonitorState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "nome",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 50.0,
                                  child: ListView.builder(
                                    itemCount:
                                        1,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            "\$${state.transactionValuesList[state.transactionValuesList.length - 1].wallet}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Last orders",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 100.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.transactionValuesList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 100.0,
                                  child: Card(
                                    color: Colors.blueGrey[100],
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "${state.transactionValuesList[index].currencyPair.toUpperCase()}",
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                                state
                                                        .transactionValuesList[
                                                            index]
                                                        .buySell
                                                    ? "Buy"
                                                    : "Sell",
                                                textAlign: TextAlign.left),
                                            Text(
                                                "${state.transactionValuesList[index].quantity}",
                                                textAlign: TextAlign.right),
                                          ],
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Open orders",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 100.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.transactionValuesList.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  width: 100.0,
                                  child: Card(
                                    color: Colors.blueGrey[100],
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "${state.transactionValuesList[index].currencyPair.toUpperCase()}",
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                                state
                                                        .transactionValuesList[
                                                            index]
                                                        .buySell
                                                    ? "Buy"
                                                    : "Sell",
                                                textAlign: TextAlign.left),
                                            Text(
                                                "${state.transactionValuesList[index].quantity}",
                                                textAlign: TextAlign.right),
                                          ],
                                        )),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )),
            Container(child: BlocBuilder<MonitorBloc, MonitorState>(
              builder: (context, state) {
                bool crossFadeFirst = false;
                if (state.changeForm == true) {
                  crossFadeFirst = true;
                } else {
                  crossFadeFirst = false;
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 50.0,
                                  child: ListView.builder(
                                    itemCount:
                                        1,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Text(
                                            "\$${state.transactionValuesList[state.transactionValuesList.length - 1].wallet}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Buy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28)),
                              Switch(
                                activeTrackColor: Colors.blueGrey[900],
                                inactiveTrackColor: Colors.blueGrey[900],
                                value: crossFadeFirst,
                                onChanged: (value) {
                                  BlocProvider.of<MonitorBloc>(context)
                                      .add(ChangeForm(change: value));
                                },
                                activeColor: Colors.red,
                                inactiveThumbColor: Colors.green,
                              ),
                              Text("Sell",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28)),
                            ],
                          )
                        ],
                      ),
                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 300),
                        firstChild: Container(
                          child: SellForm(),
                        ),
                        secondChild: Container(
                          child: BuyForm(),
                        ),
                        crossFadeState: crossFadeFirst
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      )
                    ],
                  ),
                );
              },
            )),
            Container(child: BlocBuilder<MonitorBloc, MonitorState>(
              builder: (context, state) {
                int itemsQtt = state.transactionValuesList == null
                    ? 0
                    : state.transactionValuesList.length > 0
                        ? state.transactionValuesList.length
                        : 1;
                const double cardElevation = 10;
                return ListView.builder(
                  itemCount: itemsQtt,
                  itemBuilder: (context, index) {
                    return state.transactionValuesList == null
                        ? Center(child: Text("null error"))
                        : state.transactionValuesList.length > 0
                            ? Card(
                                color: Colors.blueGrey[100],
                                elevation: cardElevation,
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                              '${state.transactionValuesList[index].currencyPair.toUpperCase()}'),
                                          Text(
                                              '\$${state.transactionValuesList[index].orderPrice}')
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.arrow_forward),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(state
                                                  .transactionValuesList[index]
                                                  .buySell
                                              ? "Buy"
                                              : "Sell"),
                                          Text(
                                              '${state.transactionValuesList[index].quantity}')
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ))
                            : Center(child: Text("no made"));
                  },
                );
              },
            )),
          ]),
        ));
  }
}
