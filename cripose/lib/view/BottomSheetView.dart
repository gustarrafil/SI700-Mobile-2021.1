import '../controller/ConfirmationComponent.dart';
import 'package:flutter/material.dart';

Widget bottomSheetView(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("Transação",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ConfirmationComponent(),
        Column(
          children: [
            Text("Do you want to confirm the transaction?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("CONFIRM TRANSACTION")),
          ],
        )
      ]));
}
