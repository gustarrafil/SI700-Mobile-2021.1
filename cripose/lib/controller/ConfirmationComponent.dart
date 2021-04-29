import 'package:flutter/material.dart';

class ConfirmationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
      },
              children: [
                TableRow(
        children: [
                Text("Par da Moeda"),
Text("BTC")
                ,]
                
                
              ,
            ),
            TableRow(
        children: [
                Text("Quantidade:"),
                Text("quantidade"),]
                
                
              ,
            ),

          ],
        );
  }
}