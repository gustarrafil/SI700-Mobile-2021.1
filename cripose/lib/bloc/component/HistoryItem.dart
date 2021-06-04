import '../../model/TransactionValues.dart';
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
          ],
        ),
        Column(
          children: [Text(transactionValues.buySell ? "comprar" : "venda"), Text('${transactionValues.quantity}')],
        ),
      ],
    );
  }
}
