import 'package:flutter/material.dart';

class TelaHistory extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return screenHistory();
    }
}

Widget screenHistory() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Text("Histórico"),
                    Text("btc/usdt 61000"),
                ]
            ),
        ),
    );
}