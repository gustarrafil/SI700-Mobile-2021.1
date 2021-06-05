import 'package:cripose/bloc/logic/manage_db/manage_db.dart';
import 'package:cripose/model/TransactionValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();
  TransactionValues transactionValues = new TransactionValues();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(builder: (context, state) {
      if (state is InsertState) {
        return Form(
          key: buyForm,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              parmoedaFormField(transactionValues),
              precoFormField(transactionValues),
              qtdFormField(transactionValues),
              gatilho(transactionValues, state, context),
              submitButton(transactionValues, state, context)
            ],
          ),
        );
      }
    });
  }

    Widget gatilho(TransactionValues transactionValues, state, context) {
        return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
                transactionValues.buySell = true;
                // BlocProvider.of<ManageRemoteBloc>(context).add(
                //     CreateTriggerEvent(transactionValues: transactionValues));
                
            }, 
            child: Text('TRIGGER'));
    }

  Widget submitButton(TransactionValues transactionValues, state, context) {
    return ElevatedButton(
        style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
        child: Text("FINISH"),
        onPressed: () {
            transactionValues.buySell = true;
          if (buyForm.currentState.validate()) {
            buyForm.currentState.save();
            BlocProvider.of<ManageRemoteBloc>(context).add(
                SubmitTransactionEvent(transactionValues: transactionValues));
            //     Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (_) => BlocProvider.value(
            //         value: BlocProvider.of<ManageLocalBloc>(context),
            //         child: SecondScreen(
            //           title: 'screen',
            //         ),
            //       ),
            //     ),
            //   );
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
