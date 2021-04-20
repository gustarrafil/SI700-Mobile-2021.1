
import 'package:flutter/material.dart';

class Tela1 extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return presentationScreen();
    }
}

Widget presentationScreen() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    children: [
                                        Text("Gustavo"),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    children: [
                                        Text("\$100"),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    children: [
                                        Text("Últimas ordens"),
                                    ],
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    children: [
                                        Text("Ordens abertas"),
                                    ],
                                ),
                            ),
                        ],
                    ),
                    Row(
                        children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text("SAIR")
                            )
                        ],
                    ),
                ],
            ),
            ],
        ),
    );
}