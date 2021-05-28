import 'package:cripose/model/TransactionValues.dart';
import 'package:cripose/model/User.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {
}

class UpdateList extends MonitorEvent {
  List<TransactionValues> transactionValuesList;
  List<int> idList;
  UpdateList({this.transactionValuesList, this.idList});
}

class UpdateWallet extends MonitorEvent {
  List<TransactionValues> transactionValuesList;
  List<int> idList;
  UpdateWallet({this.transactionValuesList, this.idList});
}
