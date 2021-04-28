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
        Text(transaction.fromCurrency),
        Text(transaction.toCurrency),
        Text(transaction.fromValue.toString()),
        Text(transaction.toValue.toString()),
      ],
    );
  }
}
