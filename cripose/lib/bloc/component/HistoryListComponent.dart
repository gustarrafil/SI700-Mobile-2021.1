import 'package:cripose/bloc/logic/monitor_db/monitor_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/ChartView.dart';
import 'HistoryItem.dart';
import 'package:flutter/material.dart';

class HistoryListComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionListState();
  }
}

class _TransactionListState extends State<HistoryListComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      print(state.transactionValuesList);
      return getList(state.transactionValuesList, state.idList);
    });
  }

  ListView getList(transactionValuesList, idList) {
      print(transactionValuesList);
    int itemsQtt =
        transactionValuesList == null ? 0 : transactionValuesList.length > 0 ? transactionValuesList.length : 1;
    const double cardElevation = 10;
    return ListView.builder(
        itemCount: itemsQtt,
        itemBuilder: (context, index) {
          return transactionValuesList == null
            ? Center(child: Text("null error"))
            : transactionValuesList.length > 0
              ? Card(
                  color: Colors.blueGrey[100],
                  elevation: cardElevation,
                  child: ListTile(
                    title: HistoryItem(transactionValuesList[index]),
                    onTap: () {
                      // FALTA O PEDIDO DE TODOS OS VALORES PRA COLOCAR NO GRAFICO
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) {
                      //         return Dialog(
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20.0)),
                      //           child: Container(
                      //             constraints: BoxConstraints(maxHeight: 450),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(12.0),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [ChartView()],
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       });
                    },
                  ))
              : Center(child: Text("No transactions made!"));
        });
  }
}
