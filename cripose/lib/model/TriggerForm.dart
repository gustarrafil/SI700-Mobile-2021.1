import 'package:flutter/material.dart';
import '../controller/TriggerTypeDropDown.dart';

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
    decoration: InputDecoration(labelText: "Currency pair"),
  );
}

Widget triggerType() {
  return DropDownDemo();
}

Widget triggerValue() {
  return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Trigger value"));
}
