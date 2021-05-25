import 'package:cripose/model/TransactionValues.dart';
import 'package:cripose/view/BottomSheetView.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UserState extends ManageState {}

class BottomFinalState extends ManageState {
  TransactionValues transactionValues;

  BottomFinalState({this.transactionValues});
}
