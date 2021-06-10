import 'dart:async';
import 'package:cripose/data/web_database.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class ChangeForm extends MonitorEvent {
    bool change = true;
    ChangeForm({this.change});
}

class UpdateList extends MonitorEvent {
  List<Transaction> transactionValuesList;
  List<int> idList;
  UpdateList({this.transactionValuesList, this.idList});
}

//////////////////////////////////////////////////////////////////////////


class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  StreamSubscription _remoteSubscription;

  List<Transaction> remoteTransactionValuesList;
  List<int> remoteIdList;

  MonitorBloc() : super(MonitorState(transactionValuesList: [], idList: [])) {
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
          idList: List.from(remoteIdList),
          transactionValuesList: List.from(remoteTransactionValuesList));
    } else if (event is UpdateList) {
      yield MonitorState(
          idList: event.idList,
          transactionValuesList: event.transactionValuesList);
    } else if (event is ChangeForm) {
        print(event.change);
        if (event.change == true) {
            yield MonitorState(changeTrue: event.change);
        }
        else if (event.change == false) {
            yield MonitorState(changeFalse: event.change);
        }
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
  bool changeTrue;
  bool changeFalse;
  MonitorState(
      {this.transactionValuesList,
      this.idList,
      this.changeTrue,
      this.changeFalse
      });
}
