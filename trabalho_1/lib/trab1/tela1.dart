
import 'package:flutter/material.dart';

class TelaUser extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return screenUser();
    }
}

Widget screenUser() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                "Gustavo",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                                "\$100",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                ),
                            ),
                        ),
                    ],
                ),
                Column(
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    Text("Últimas ordens"),
                                    Row(
                                        children: [
                                            Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: const Color(5),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 8,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12),
                                                )
                                            ),
                                        ],
                                    )
                                ],
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                    Text("Ordens abertas"),
                                    Row(
                                        children: [
                                            Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: const Color(5),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 8,
                                                    ),
                                                    borderRadius: BorderRadius.circular(12),
                                                )
                                            )
                                        ],
                                    )
                                ],
                            ),
                        ),
                    ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("SAIR")
                            )
                        ),
                    ],
                ),
            ]
        ),
    );
}