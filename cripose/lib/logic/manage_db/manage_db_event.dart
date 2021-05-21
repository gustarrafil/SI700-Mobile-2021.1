import 'package:cripose/model/TransactionValues.dart';

abstract class ManageEvent {}

// class DeleteEvent extends ManageEvent {
//   int transactionId;
//   DeleteEvent({this.transactionId});
// }

class SubmitEvent extends ManageEvent {
  TransactionValues transactionValues;
  SubmitEvent({this.transactionValues});
}
