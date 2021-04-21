import '../controller/BotaoSaida.dart';
import '../controller/OrdensAbertas.dart';
import '../controller/UltimasOrdens.dart';
import '../controller/UserName.dart';
import '../controller/UserWallet.dart';
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
                        userName(),
                        userWallet(),
                    ],
                ),
                Column(
                    children: [
                        ultimasOrdens(),
                        ordensAbertas(),
                    ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        botaoSaida()
                    ],
                ),
            ]
        ),
    );
}

