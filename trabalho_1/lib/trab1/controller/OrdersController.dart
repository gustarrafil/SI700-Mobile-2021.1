import 'package:flutter/material.dart';
import '../controller/TradeItemBox.dart';

class OrdersController extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
                children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 100.0,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: tradeItem()
                        )
                    )
                ]
            ),
        );
    }

    List<Widget> tradeItem() {
        List<Widget> listaLocal = [];
        for (int i = 0; i < 5; i++) {
            listaLocal.add(TradeItemBox());
        }
        return listaLocal;
    }
}


