import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SellForm extends StatelessWidget {
  final GlobalKey<FormState> sellForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      //   if (state is InsertState) {
      Transaction transactionValues = new Transaction();
      return Form(
        key: sellForm,
        child: Column(
          children: [
            parmoedaFormField(transactionValues),
            precoFormField(transactionValues),
            qtdFormField(transactionValues),
            // submitButton("gatilho",transactionValues, state, context),
            submitButton("envio", transactionValues, state, context)
          ],
        ),
      );
      //   }
    });
  }

  Widget submitButton(
      String acao, Transaction transactionValues, state, context) {
    transactionValues.buySell = false;
    // if (acao == "gatilho") {
    //   return ElevatedButton(
    //       style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
    //       child: Text("gatilho"),
    //       onPressed: () {
    //         if (sellForm.currentState!.validate()) {
    //           sellForm.currentState!.save();
    //           //   Navigator.of(context).pushNamed("/second");
    //         }
    //       });
    // } else {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
        child: Text("Insert Data"),
        onPressed: () {
          if (sellForm.currentState!.validate()) {
            sellForm.currentState!.save();
            BlocProvider.of<ManageRemoteBloc>(context).add(
                SubmitTransactionEvent(transactionValues: transactionValues));
          }
        });
    // }
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
