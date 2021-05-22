import '../model/TransactionValues.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  TransactionValues transactionValues;
  HistoryItem(item) {
    transactionValues = item;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('${transactionValues.currencyPair}'),
            Text('${transactionValues.orderPrice}')
          ],
        ),
        Column(
          children: [
            Icon(Icons.arrow_forward),
            Text('${transactionValues.dateTime.day}/${transactionValues.dateTime.month}/${transactionValues.dateTime.year}'),
            Text('${transactionValues.dateTime.hour}h${transactionValues.dateTime.minute}'),
          ],
        ),
        Column(
          children: [
              Text('${transactionValues.buySell ? "venda" : "compra"}'),
            Text('${transactionValues.quantity}')
          ],
        ),
      ],
    );
  }
}
