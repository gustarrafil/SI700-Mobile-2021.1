import 'package:cripose/data/web_database.dart';
import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriggerForm extends StatelessWidget {
  final GlobalKey<FormState> triggerForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      Transaction transactionValues = new Transaction();
      
      return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
          return Column(
            children: [
              Form(
                key: triggerForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    triggerNameField(transactionValues),
                    triggerValueField(transactionValues),
                    submitButton(transactionValues, state, context)
                  ],
                ),
              ),
            ],
          );
        },
      );
    });
  }

  submitButton(Transaction transactionValues, state, context) {
    transactionValues.buySell = false;
    transactionValues.currencyPair = "";
    transactionValues.orderPrice = 0;
    transactionValues.quantity = 0;
    transactionValues.wallet = 0.0;
    transactionValues.userName = "";
    transactionValues.triggerName = "";
    transactionValues.triggerValue = 0.0;
    transactionValues.trigger = true;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: Text("CREATE TRIGGER"),
          onPressed: () {
            if (triggerForm.currentState!.validate()) {
              triggerForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  CompleteEvent(
                    previousTransactionValues: transactionValues));
              Navigator.of(context).pushNamed("/");
            }
          }),
    );
  }

  Widget triggerValueField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Trigger value"),
      validator: (value) {
        if (double.parse(value!) == 0.0) {
          return "Insert trigger value";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.triggerValue = double.parse(value!);
      },
    );
  }

  Widget triggerNameField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: "Currency pair name to trigger"),
      validator: (value) {
      },
      onSaved: (value) {
        transactionValues.triggerName = value!;
      },
    );
  }
}
