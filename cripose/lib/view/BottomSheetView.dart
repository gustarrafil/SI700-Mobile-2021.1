import 'package:flutter/material.dart';

Widget bottomSheet(BuildContext context) {
  return Container(
height: MediaQuery.of(context).size.height * 0.6,
decoration: new BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [
Text("Ordem de Compra"),
        Row(
          children: [
            Table(
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
        ),

      ],
    ),
Text("Deseja confirmar a transação ?"),

ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();},

            child: Text("Confirmar transação"))
]
    )
  );}
