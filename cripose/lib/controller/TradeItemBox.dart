import '../model/TransactionValues.dart';
import 'package:flutter/material.dart';

class TradeItemBox extends StatelessWidget {
  TransactionValues transaction;
  TradeItemBox() {
    transaction = TransactionValues();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            color: Colors.blueGrey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(transaction.fromCurrency),
                      ],
                    ),
                    Row(
                      children: [
                        Text(transaction.toCurrency),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(transaction.fromValue.toString()),
                      ],
                    ),
                  ]),
            )),
        width: 100);
  }
}
