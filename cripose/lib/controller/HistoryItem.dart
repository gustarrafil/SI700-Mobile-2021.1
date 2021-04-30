import '../model/Transaction.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  Transaction transaction;
  HistoryItem() {
    transaction = Transaction();
  }
  @override
  // todo: vindo de transaction
  //        par da moeda
  //       Quantidade
  //       Data
  //
  // Ao click open new confirmation transaction sem botao de confirmação
  // só informações de transaction
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(transaction.fromCurrency),
            Text(transaction.fromValue.toString()),
          ],
        ),
        Column(
          children: [
            Icon(Icons.arrow_forward),
            Text("data"),
            Text("hora"),
          ],
        ),
        Column(
          children: [
            Text(transaction.toCurrency),
            Text(transaction.toValue.toString()),
          ],
        ),
      ],
    );
  }
}
