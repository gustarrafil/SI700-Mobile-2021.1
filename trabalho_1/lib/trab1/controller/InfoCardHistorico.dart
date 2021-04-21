import 'package:flutter/material.dart';

Widget infoCardHistorico() {
    return ListTile(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Text("BTC"),
                Text("USD"),
                Text("\$300"),
            ],
        ),
    );
}