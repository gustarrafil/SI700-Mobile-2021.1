import 'package:cripose/bloc/logic/manage_db/manage_db_event.dart';
import 'package:cripose/bloc/logic/manage_db/manage_db_state.dart';
import 'package:cripose/bloc/logic/manage_db/manage_local_db_bloc.dart';
import 'package:cripose/model/TransactionValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageLocalBloc, ManageState>(builder: (context, state) {
      if (state is InsertState) {
        TransactionValues transactionValues = new TransactionValues();
        return Form(
          key: buyForm,
          child: Column(
            children: [
              parmoedaFormField(transactionValues),
              precoFormField(transactionValues),
              qtdFormField(transactionValues),
              submitButton(transactionValues, state, context)
              // TradeSlider()
            ],
          ),
        );
      }
    });
  }

  Widget submitButton(TransactionValues transactionValues, state, context) {
    return ElevatedButton(
        child: Text("Insert Data"),
        onPressed: () {
          if (buyForm.currentState.validate()) {
            buyForm.currentState.save();
            BlocProvider.of<ManageLocalBloc>(context).add(
                SubmitTransactionEvent(transactionValues: transactionValues));
          }
        });
  }

  Widget precoFormField(TransactionValues transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Buy price"),
      validator: (value) {
        if (double.parse(value) == 0.0) {
          return "Insert buy price";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.orderPrice = double.parse(value);
      },
    );
  }

  Widget qtdFormField(TransactionValues transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Quantity"),
      validator: (value) {
        if (double.parse(value) == 0.0) {
          return "Insert quantity";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.quantity = double.parse(value);
      },
    );
  }

  Widget parmoedaFormField(TransactionValues transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: "Currency pair"),
      validator: (value) {
        if (value.length == 0) {
          return "Insert currency pair";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.currencyPair = value;
      },
    );
  }
}
