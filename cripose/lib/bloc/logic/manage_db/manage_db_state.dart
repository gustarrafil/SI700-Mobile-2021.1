import 'package:cripose/model/TransactionValues.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UserState extends ManageState {}

class BottomFinalState extends ManageState {
  TransactionValues transactionValues;

  BottomFinalState({this.transactionValues});
}
