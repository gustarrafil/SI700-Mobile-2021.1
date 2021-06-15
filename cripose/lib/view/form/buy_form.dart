import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class BuyForm extends StatelessWidget {
//   final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();
//   Transaction transactionValues = new Transaction();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ManageRemoteBloc, ManageState>(
//         builder: (context, state) {
//       return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
//         return Form(
//           key: buyForm,
//           child: Column(
//             children: [
//               parmoedaFormField(transactionValues),
//               precoFormField(transactionValues),
//               qtdFormField(transactionValues),
//               // gatilho(transactionValues, state, context),
//               submitButton("gatilho", transactionValues, state, context),
//               submitButton("envio", transactionValues, state, context),
//             ],
//           ),
//         );
//       });
//     });
//   }

//   // NAO TA FUNCIONANDO A ROTA PRA PAGINA DE GATILHO

// //   Widget gatilho(Transaction transactionValues, state, context) {
// //     return ElevatedButton(
// //         onPressed: () {
// //           transactionValues.buySell = true;
// //           // BlocProvider.of<ManageRemoteBloc>(context).add(
// //           //     CreateTriggerEvent(transactionValues: transactionValues));
// //           Navigator.of(context).pushNamed("/second");
// //         },
// //         child: Text('botao gatilho'));
// //   }

//   Widget submitButton(
//       String acao, Transaction transactionValues, state, context) {
//     transactionValues.buySell = true;
//     if (acao == "gatilho") {
//       return ElevatedButton(
//           child: Text("gatilho"),
//           onPressed: () {
//             if (buyForm.currentState!.validate()) {
//               buyForm.currentState!.save();
//               Navigator.of(context).pushNamed("/second");
//             }
//           });
//     } else {
//       return ElevatedButton(
//           child: Text("Insert Data"),
//           onPressed: () {
//             if (buyForm.currentState!.validate()) {
//               buyForm.currentState!.save();
//               BlocProvider.of<ManageRemoteBloc>(context).add(
//                   SubmitTransactionEvent(transactionValues: transactionValues));
//             }
//           });
//     }
//   }

//   Widget precoFormField(Transaction transactionValues) {
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(labelText: "Buy price"),
//       validator: (value) {
//         if (double.parse(value!) == 0.0) {
//           return "Insert buy price";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         transactionValues.orderPrice = double.parse(value!);
//       },
//     );
//   }

//   Widget qtdFormField(Transaction transactionValues) {
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(labelText: "Quantity"),
//       validator: (value) {
//         if (double.parse(value!) == 0.0) {
//           return "Insert quantity";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         transactionValues.quantity = double.parse(value!);
//       },
//     );
//   }

//   Widget parmoedaFormField(Transaction transactionValues) {
//     return TextFormField(
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(labelText: "Currency pair"),
//       validator: (value) {
//         if (value!.length == 0) {
//           return "Insert currency pair";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         transactionValues.currencyPair = value!;
//       },
//     );
//   }
// }


class BuyForm extends StatelessWidget {
  final GlobalKey<FormState> buyForm = new GlobalKey<FormState>();
  Transaction transactionValues = new Transaction();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageRemoteBloc, ManageState>(
        builder: (context, state) {
      return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
        return Form(
          key: buyForm,
          child: Column(
            children: [
              parmoedaFormField(transactionValues),
              precoFormField(transactionValues),
              qtdFormField(transactionValues),
              // gatilho(transactionValues, state, context),
              submitButton("gatilho", transactionValues, state, context),
              submitButton("envio", transactionValues, state, context),
            ],
          ),
        );
      });
    });
  }

  // NAO TA FUNCIONANDO A ROTA PRA PAGINA DE GATILHO

//   Widget gatilho(Transaction transactionValues, state, context) {
//     return ElevatedButton(
//         onPressed: () {
//           transactionValues.buySell = true;
//           // BlocProvider.of<ManageRemoteBloc>(context).add(
//           //     CreateTriggerEvent(transactionValues: transactionValues));
//           Navigator.of(context).pushNamed("/second");
//         },
//         child: Text('botao gatilho'));
//   }

  Widget submitButton(
      String acao, Transaction transactionValues, state, context) {
    transactionValues.buySell = true;
    if (acao == "gatilho") {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900]),
          child: Text("gatilho"),
          onPressed: () {
            if (buyForm.currentState!.validate()) {
              buyForm.currentState!.save();
            //   Navigator.of(context).pushNamed("/second");
            }
          });
    } else {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey[900]),
          child: Text("Insert Data"),
          onPressed: () {
            if (buyForm.currentState!.validate()) {
              buyForm.currentState!.save();
              BlocProvider.of<ManageRemoteBloc>(context).add(
                  SubmitTransactionEvent(transactionValues: transactionValues));
            }
          });
    }
  }

  Widget precoFormField(Transaction transactionValues) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Buy price"),
      validator: (value) {
        if (double.parse(value!) == 0.0) {
          return "Insert buy price";
        }
        return null;
      },
      onSaved: (value) {
        transactionValues.orderPrice = double.parse(value!);
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
