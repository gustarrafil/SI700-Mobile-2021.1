import 'dart:async';

import 'package:cripose/data/web/web_database.dart';
import 'package:cripose/model/TransactionValues.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<TransactionValues> transactionValuesList;
  List<int> idList;
  UpdateList({this.transactionValuesList, this.idList});
}

//////////////////////////////////////////////////////////////////////////


class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _localSubscription;

  MonitorBloc() : super(MonitorState(transactionValuesList: [], idList: [])) {
    add(AskNewList());
    _localSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        List<TransactionValues> localtransactionValuesList = response[0];
        List<int> localIdList = response[1];
        add(UpdateList(
            transactionValuesList: localtransactionValuesList,
            idList: localIdList));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      var response =
          await DatabaseRemoteServer.helper.getTransactionValuesList();
      List<TransactionValues> localtransactionValuesList = response[0];
      List<int> localIdList = response[1];
      yield MonitorState(
          idList: localIdList,
          transactionValuesList: localtransactionValuesList);
    } else if (event is UpdateList) {
      yield MonitorState(
          idList: event.idList,
          transactionValuesList: event.transactionValuesList);
    }
  }

  close() {
    _localSubscription.cancel();
    return super.close();
  }
}


//////////////////////////////////////////////////////////////////////////////////


class MonitorState {
  List<TransactionValues> transactionValuesList;
  List<int> idList;
  MonitorState(
      {this.transactionValuesList,
      this.idList,
      });
}
