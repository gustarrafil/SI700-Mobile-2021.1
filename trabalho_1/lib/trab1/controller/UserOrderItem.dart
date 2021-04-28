import '../model/Transaction.dart';
import 'package:flutter/material.dart';

class UserOrderItem extends StatelessWidget {
  Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            color: Colors.blue,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(transaction.fromCurrency),
                  Text(transaction.fromValue.toString()),
                ])),
        width: 100);
  }
}
