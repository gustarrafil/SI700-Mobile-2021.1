import 'package:flutter/material.dart';

class TriggerForm extends StatelessWidget {
  final GlobalKey<FormState> triggerForm = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: triggerForm,
      child: Column(
        children: [
          currencyPair(),
          triggerType(),
          triggerValue(),
        ],
      ),
    );
  }
}

Widget currencyPair() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(labelText: "Par de moeda"),
  );
}

Widget triggerType() {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Tipo de gatilho, > < <= >="),
  );
}

//
//
Widget triggerValue() {
  return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Preço Gatilho"));
}
