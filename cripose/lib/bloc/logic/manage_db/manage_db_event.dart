import 'package:cripose/model/TransactionValues.dart';
import 'package:cripose/model/User.dart';

abstract class ManageEvent {}

class DeleteTransactionEvent extends ManageEvent {
  int transactionId;
  DeleteTransactionEvent({this.transactionId});
}

class SubmitTransactionEvent extends ManageEvent {
  TransactionValues transactionValues;
  SubmitTransactionEvent({this.transactionValues});
}

class SubmitSignEvent extends ManageEvent {
  User user;
  SubmitSignEvent({this.user});
}

class Login extends ManageEvent {
  User user;
  int id;
  Login({this.user, this.id});
}
