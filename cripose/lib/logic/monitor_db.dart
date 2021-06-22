import 'dart:async';
import 'package:cripose/data/web_database.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class ChangeForm extends MonitorEvent {
  bool change = true;
  ChangeForm({required this.change});
}

class UpdateList extends MonitorEvent {
  List<Transaction> transactionValuesList;
  List<int> idList;
  UpdateList({required this.transactionValuesList, required this.idList});
}

//////////////////////////////////////////////////////////////////////////

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  late StreamSubscription _remoteSubscription;

  late List<Transaction> remoteTransactionValuesList;
  late List<int> remoteIdList;

  MonitorBloc()
      : super(MonitorState(
            transactionValuesList: [], idList: [], changeForm: true)) {
    add(AskNewList());
    _remoteSubscription = DatabaseRemoteServer.helper.stream.listen((response) {
      try {
        remoteTransactionValuesList = response[0];
        remoteIdList = response[1];
        add(UpdateList(
            transactionValuesList: List.from(remoteTransactionValuesList),
            idList: List.from(remoteIdList)));
      } catch (e) {}
    });
  }

  @override
  Stream<MonitorState> mapEventToState(MonitorEvent event) async* {
    if (event is AskNewList) {
      var remoteResponse =
          await DatabaseRemoteServer.helper.getTransactionValuesList();
      remoteTransactionValuesList = remoteResponse[0];
      remoteIdList = remoteResponse[1];
      yield MonitorState(
          changeForm: true, //teste
          idList: List.from(remoteIdList),
          transactionValuesList: List.from(remoteTransactionValuesList));
    } else if (event is UpdateList) {
      yield MonitorState(
          changeForm: true, //teste
          idList: event.idList,
          transactionValuesList: event.transactionValuesList);
    } else if (event is ChangeForm) {
      print(event.change);
      var remoteResponse =
          await DatabaseRemoteServer.helper.getTransactionValuesList();
          remoteTransactionValuesList = remoteResponse[0];
      remoteIdList = remoteResponse[1];
      yield MonitorState(
          changeForm: event.change, //teste
          idList: List.from(remoteIdList),
          transactionValuesList: List.from(remoteTransactionValuesList));
    }
  }

  close() {
    _remoteSubscription.cancel();
    return super.close();
  }
}

//////////////////////////////////////////////////////////////////////////////////

class MonitorState {
  List<Transaction> transactionValuesList;
  List<int> idList;
  bool changeForm;
  MonitorState(
      {required this.transactionValuesList,
      required this.idList,
      required this.changeForm});
}
