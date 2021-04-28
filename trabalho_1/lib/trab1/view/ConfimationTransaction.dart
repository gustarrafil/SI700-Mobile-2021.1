import 'package:flutter/material.dart';

Widget bottomSheet(BuildContext context) {
  return Container(
    color: Colors.blue[100],
    child: Row(
      children: [
        Column(
          children: [
            Text("Ordem de Compra"),
            Text("Par da Moeda"),
            Text("Quantidade: quantidade"),
            Text("Deseja confirmar a transação ?"),
            TextButton(
                child: Text("Confirmar transação"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
  );
}
