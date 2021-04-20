import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return presentationScreen();
    }
}

Widget presentationScreen() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
                children: [
                    Row(
                        children: [
                            Text("Histórico"),
                        ],
                    ),
                    Row(
                        children: [
                            Text("btc/usdt 61000"),
                        ],
                    ),
                ],
            ),
        ),
    );
}