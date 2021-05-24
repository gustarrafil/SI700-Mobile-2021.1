import 'package:flutter/material.dart';

class ConfirmationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Currency pair",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text("BTC",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Quantity:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            Text("0.0003",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          ],
        ),
      ],
    );
  }
}
