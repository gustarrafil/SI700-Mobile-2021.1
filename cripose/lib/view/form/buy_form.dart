import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
          Transaction transactionValues = new Transaction();
        return Column(
          children: [
            Form(
              key: buyForm,
              child: Column(
                children: [
                  parmoedaFormField(transactionValues),
                  precoFormField(transactionValues),
                  qtdFormField(transactionValues),
                  Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: submitButton(transactionValues, state, context),
                )
                ],
              ),
            ),
            triggerButton(transactionValues, state, context),
          ],
        );
      });
    });


  }

  Widget triggerButton(Transaction transactionValues, state, context) {
    // transactionValues.buySell = false;
    // transactionValues.wallet = 0.0;
    // transactionValues.userName = "";
    // transactionValues.triggerName = "";
    // transactionValues.triggerValue = 0.0;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: Text("TRIGGER"),
          onPressed: () {
            if (buyForm.currentState!.validate()) {
              transactionValues.trigger = true;
              transactionValues.triggerName = "";
              transactionValues.triggerValue = 0.0;
              buyForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  TriggerEvent(previousTransactionValues: transactionValues));
              Navigator.of(context).pushNamed("/gatilho");
            }
          }),
    );
  }

  Widget submitButton(
      Transaction transactionValues, state, context) {
    transactionValues.buySell = true;
    transactionValues.wallet = 0.0;
    transactionValues.userName = "";
    return SizedBox(
        width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: Text("BUY ORDER"),
          onPressed: () {
            if (buyForm.currentState!.validate()) {
                transactionValues.triggerName = "";
                transactionValues.triggerValue = 0.0;
              transactionValues.trigger = false;
              buyForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  SubmitTransactionEvent(transactionValues: transactionValues));
            }
          }),
    );
  }

  Widget precoFormField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Buy price"),
      validator: (value) {
        if (double.parse(value as String) == 0.0) {
          return "Insert buy price";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.orderPrice = double.parse(value as String);
      },
    );
  }

  Widget qtdFormField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Quantity"),
      validator: (value) {
        if (double.parse(value!) == 0.0) {
          return "Insert quantity";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.quantity = double.parse(value!);
      },
    );
  }

  Widget parmoedaFormField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Currency pair"),
      validator: (value) {
        if (value!.length == 0) {
          return "Insert currency pair";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.currencyPair = value!;
      },
    );
  }
}
