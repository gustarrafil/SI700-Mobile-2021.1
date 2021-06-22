import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SellForm extends StatelessWidget {
  final GlobalKey<FormState> sellForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
        //   if (state is InsertState) {
        Transaction transactionValues = new Transaction();
        return Column(
          children: [
            Form(
              key: sellForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  parmoedaFormField(transactionValues),
                  precoFormField(transactionValues),
                  qtdFormField(transactionValues),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: submitButton(transactionValues, state, context),
                  ),
                ],
              ),
            ),
            triggerButton(transactionValues, state, context),
          ],
        );
      }
          //   throw("This is my first general exception");
          // }
          );
    });
  }

  Widget submitButton(Transaction transactionValues, state, context) {
    transactionValues.buySell = false;
    transactionValues.wallet = 0.0;
    transactionValues.userName = "";
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: Text("SELL ORDER"),
          onPressed: () {
            if (sellForm.currentState!.validate()) {
              transactionValues.triggerName = "";
              transactionValues.triggerValue = 0.0;
              transactionValues.trigger = false;
              sellForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  SubmitTransactionEvent(transactionValues: transactionValues));
            }
          }),
    );
  }

  Widget triggerButton(Transaction transactionValues, state, context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
          child: Text("TRIGGER"),
          onPressed: () {
            if (sellForm.currentState!.validate()) {
              transactionValues.trigger = true;
              transactionValues.triggerName = "";
              transactionValues.triggerValue = 0.0;
              sellForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  TriggerEvent(previousTransactionValues: transactionValues));
              Navigator.of(context).pushNamed("/gatilho");
            }
          }),
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

  Widget precoFormField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Sell price"),
      validator: (value) {
        if (double.parse(value as String) == 0.0) {
          return "Insert sell price";
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
}
