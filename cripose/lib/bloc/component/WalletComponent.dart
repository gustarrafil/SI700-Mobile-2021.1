import 'package:cripose/model/Wallet.dart';
import 'package:flutter/material.dart';

Widget walletComponent() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      '\$${(new Wallet()).walletValueDouble}',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
  );
}
