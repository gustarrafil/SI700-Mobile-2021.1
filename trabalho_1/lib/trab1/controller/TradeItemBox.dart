import '../model/Transaction.dart';
import 'package:flutter/material.dart';

class TradeItemBox extends StatelessWidget {
  Transaction transaction;
  TradeItemBox() {
    transaction = Transaction();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            color: Colors.blue,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(transaction.fromCurrency),
                  Text(transaction.toCurrency),
                  Text(transaction.fromValue.toString()),
                ])),
        width: 100);
  }
}
