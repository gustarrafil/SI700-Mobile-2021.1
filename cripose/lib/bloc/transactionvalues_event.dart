part of 'transactionvalues_bloc.dart';

@immutable
abstract class TransactionvaluesEvent {}

class SubmitEvent extends TransactionvaluesEvent {
  TransactionValues transactionValues;
  SubmitEvent({this.transactionValues});
}