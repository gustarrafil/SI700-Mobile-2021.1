import '../../model/TransactionValues.dart';
import 'package:flutter/material.dart';

class TradeItemBox extends StatelessWidget {
  TransactionValues transactionValues;
  TradeItemBox() {
    transactionValues = TransactionValues();
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
                        Text('${transactionValues.currencyPair}'),
                      ],
                    ),
                    Row(
                      children: [
                          Text('compra'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${transactionValues.quantity}'),
                      ],
                    ),
                  ]),
            )),
        width: 100);
  }
}
