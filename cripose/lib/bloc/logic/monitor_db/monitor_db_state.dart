import 'package:cripose/model/TransactionValues.dart';
import 'package:cripose/model/User.dart';

class MonitorState {
  List<TransactionValues> transactionValuesList;
  List<User> userList;
  List<int> idList;
  List<int> userIdList;
  MonitorState({this.transactionValuesList, this.idList, this.userList, this.userIdList});
}


