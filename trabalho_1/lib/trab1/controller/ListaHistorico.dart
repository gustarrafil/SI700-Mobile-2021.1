import './InfoCardHistorico.dart';
import 'package:flutter/material.dart';

Widget listaHistorico() {
    const int qtdItens = 20;
    const double cardElevation = 10;

    return ListView.builder(
        itemCount: qtdItens,
        itemBuilder: (context, index) {
            return Card(
                color: Colors.amber[100],
                elevation: cardElevation,
                child: infoCardHistorico()
            );
        }
    );
}