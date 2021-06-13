import 'package:cripose/view/screen/trade_box.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return screenUser(context);
  }
}

List<Widget> tradeItem() {
    List<Widget> listaLocal = [];
    for (int i = 0; i < 5; i++) {
      listaLocal.add(TradeItemBox());
    }
    return listaLocal;
  }

Widget screenUser(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //   nameComponent(),
            //   walletComponent(),
            ],
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Last orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: ListView(
                scrollDirection: Axis.horizontal, children: tradeItem()))
      ]),
    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Open orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 100.0,
            child: ListView(
                scrollDirection: Axis.horizontal, children: tradeItem()))
      ]),
    ),
            ],
          ),
        //   Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [ButtonComponents.logoutBtn(context)],
        //   ),
        ]),
  );
}