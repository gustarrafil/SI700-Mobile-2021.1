import 'package:flutter/material.dart';

class TriggerForm extends StatelessWidget {
  final GlobalKey<FormState> triggerForm = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: triggerForm,
      child: Column(
        children: [
fazerFuncaoFormField()
        ],
      ),
    );
  }
}

Widget fazerFuncaoFormField() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(labelText: "Par da moeda"),
  );
}

