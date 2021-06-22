import 'package:cripose/model/transaction.dart';
import 'package:flutter/material.dart';

class TradeItemBox extends StatelessWidget {
  late Transaction transaction;
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
                      ],
                    ),
                    Row(
                      children: [
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ],
                    ),
                  ]),
            )),
        width: 100);
  }
}