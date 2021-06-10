import 'package:cripose/data/web_database.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//////////////////////////////////////////////////////////////////////////////////////

abstract class ManageEvent {}

class DeleteTransactionEvent extends ManageEvent {
  int transactionId;
  DeleteTransactionEvent({required this.transactionId});
}

class SubmitTransactionEvent extends ManageEvent {
  Transaction transactionValues;
  SubmitTransactionEvent({required this.transactionValues});
}

//////////////////////////////////////////////////////////////////////////////////////////////

class ManageRemoteBloc extends Bloc<ManageEvent, ManageState> {
  ManageRemoteBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteTransactionEvent) {
      DatabaseRemoteServer.helper.deleteTransaction(event.transactionId);
    } else if (event is SubmitTransactionEvent) {
      var response = DatabaseRemoteServer.helper
          .insertTransaction(event.transactionValues);
      //   print(response);
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////////

abstract class ManageState {}

class InsertState extends ManageState {}