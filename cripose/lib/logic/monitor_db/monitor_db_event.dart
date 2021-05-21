

import 'package:cripose/model/TransactionValues.dart';

abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {
  List<TransactionValues> transactionValuesList;
  List<int> idList;
  UpdateList({this.transactionValuesList, this.idList});
}
