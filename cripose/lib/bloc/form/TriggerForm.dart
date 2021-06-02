import 'package:cripose/bloc/logic/manage_db/manage_db.dart';
import 'package:cripose/model/TransactionValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/TriggerTypeDropDown.dart';

class TriggerForm extends StatelessWidget {
  final GlobalKey<FormState> triggerForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(builder: (context, state) {
      TransactionValues transactionValues = new TransactionValues();
      return Form(
        key: triggerForm,
        child: Column(
          children: [
            currencyPair(transactionValues),
            triggerType(),
            triggerValue(transactionValues),
          ],
        ),
      );
    });
  }
}

Widget currencyPair(TransactionValues transactionValues) {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(labelText: "Currency pair"),
    onSaved: (value) {
      transactionValues.currencyPair = value;
    },
  );
}

Widget triggerType() {
  return DropDownDemo();
}

Widget triggerValue(TransactionValues transactionValues) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Trigger value"),
    onSaved: (value) {},
  );
}
