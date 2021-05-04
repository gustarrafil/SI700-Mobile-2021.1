import '../model/Transaction.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  Transaction transaction;
  HistoryItem() {
    transaction = Transaction();
  }
  @override
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
            Text("04/05/2021"),
            Text("13h38"),
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
