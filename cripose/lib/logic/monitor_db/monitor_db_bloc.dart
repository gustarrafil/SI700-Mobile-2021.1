import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cripose/data/local/local_database.dart';
import 'package:cripose/logic/monitor_db/monitor_db_event.dart';
import 'package:cripose/logic/monitor_db/monitor_db_state.dart';
import 'package:cripose/model/TransactionValues.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;

  MonitorBloc() : super(MonitorState(transactionValuesList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseLocalServer.helper.stream.listen((response) {
      try {
        List<TransactionValues> localtransactionValuesList = response[0];
        List<int> localIdList = response[1];
        add(UpdateList(transactionValuesList: localtransactionValuesList, idList: localIdList));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      var response = await DatabaseLocalServer.helper.getTransactionValuesList();
      List<TransactionValues> localtransactionValuesList = response[0];
      List<int> localIdList = response[1];
      yield MonitorState(idList: localIdList, transactionValuesList: localtransactionValuesList);
    } else if (event is UpdateList) {
      yield MonitorState(idList: event.idList, transactionValuesList: event.transactionValuesList);
    }
  }

  close() {
    _localSubscription.cancel();
    return super.close();
  }
}
