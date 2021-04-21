import 'package:flutter/material.dart';

Widget listaTrades() {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: naosei()
    );
}

List<Widget> naosei() {
    List<Widget> listaLocal = [];
    for (int i = 0; i < 5; i++) {
        listaLocal.add(SizedBox(
            child: Card(
                color: Colors.blue,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Text("BTC"),
                        Text("USD"),
                        Text("100"),
                        Text("100"),
                    ]
                )
            ),
            width: 100
        ));
    }
    return listaLocal;
}