import 'package:flutter/material.dart';
import '../controller/walletComponent.dart';
import '../controller/ButtonComponents.dart';
import '../controller/OrdersController.dart';
import '../controller/NameComponent.dart';

class UserView extends StatelessWidget {
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
                        nameComponent(),
                        walletComponent(),
                    ],
                ),
                Column(
                    children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Text(
                                    "Últimas ordens",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                ),
                            ],
                        ),
                        OrdersController(),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                                Text(
                                    "Ordens abertas",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                ),
                            ],
                        ),
                        OrdersController(),
                    ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        ButtonController.quitBtn()
                    ],
                ),
            ]
        ),
    );
}
