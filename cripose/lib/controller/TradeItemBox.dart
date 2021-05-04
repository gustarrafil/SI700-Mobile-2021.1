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
