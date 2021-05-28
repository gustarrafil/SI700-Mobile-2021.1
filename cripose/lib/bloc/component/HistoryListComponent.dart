import 'package:cripose/bloc/logic/monitor_db/monitor_db_bloc.dart';
import 'package:cripose/bloc/logic/monitor_db/monitor_db_state.dart';
import 'package:cripose/data/local/local_database.dart';
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
      return getList(state.transactionValuesList, state.idList);
      // return Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //     child: Column(
      //       children: [
      //         Expanded(
      //             child: Container(
      //                 child: historyListComponent(
      //                     state.transactionValuesList, state.idList))),
      //       ],
      //     ));
    });
  }

  ListView getList(transactionValuesList, idList) {
    const int itemsQtt = 20;
    const double cardElevation = 10;
    return ListView.builder(
        itemCount: transactionValuesList.length > 0 ? itemsQtt : 1,
        itemBuilder: (context, index) {
          return transactionValuesList.length > 0
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
