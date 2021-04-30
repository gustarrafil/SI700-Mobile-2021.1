import 'package:cripose/controller/ConfirmationComponent.dart';
import 'package:flutter/material.dart';

Widget bottomSheetView(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Ordem de Compra"),
        ConfirmationComponent(),
        Text("Deseja confirmar a transação ?"),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Confirmar transação"))
      ]));
}
