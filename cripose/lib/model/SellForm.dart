import 'package:cripose/logic/manage_db/manage_db_state.dart';
import 'package:cripose/logic/manage_db/manage_local_db_bloc.dart';
import 'package:cripose/model/TransactionValues.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/SliderComponent.dart';
import 'package:flutter/material.dart';

class SellForm extends StatelessWidget {
  final GlobalKey<FormState> sellForm = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
return BlocBuilder<ManageLocalBloc, ManageState>(builder: (context, state) {
      TransactionValues transactionValues = new TransactionValues();
      return Form(
      key: sellForm,
      child: Column(
        children: [
          parmoedaFormField(transactionValues),
          precoFormField(transactionValues),
          qtdFormField(transactionValues),
          TradeSlider()
        ],
      ),
    );
    });


    
  }
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

Widget precoFormField(TransactionValues transactionValues) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Buy price"),
    validator: (value) {
          if (value == 0) {
            return "Insert buy price";
          }
          return null;
        },
        onSaved: (value) {
          transactionValues.orderPrice = value as double;
        },
  );
}

Widget qtdFormField(TransactionValues transactionValues) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: "Quantity"),
    validator: (value) {
          if (value == 0) {
            return "Insert quantity";
          }
          return null;
        },
        onSaved: (value) {
          transactionValues.quantity = value as double;
        },
  );
}
