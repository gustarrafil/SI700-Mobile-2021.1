import 'package:cripose/data/web_database.dart';
import 'package:cripose/model/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ManageEvent {}

class DeleteTransactionEvent extends ManageEvent {
  int transactionId;
  DeleteTransactionEvent({required this.transactionId});
}

class SubmitTransactionEvent extends ManageEvent {
  Transaction transactionValues;
  SubmitTransactionEvent({required this.transactionValues});
}

class TriggerEvent extends ManageEvent {
  Transaction previousTransactionValues;
  TriggerEvent({required this.previousTransactionValues});
}
class CompleteEvent extends ManageEvent {
  Transaction previousTransactionValues;
  CompleteEvent({required this.previousTransactionValues});
}

//////////////////////////////////////////////////////////////////////////////////////////////

class ManageRemoteBloc extends Bloc<ManageEvent, ManageState> {
  ManageRemoteBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteTransactionEvent) {
      DatabaseRemoteServer.helper.deleteTransaction(event.transactionId);
    } else if (event is SubmitTransactionEvent) {
            DatabaseRemoteServer.helper
          .insertTransaction(event.transactionValues);
    } else if (event is TriggerEvent) {
        DatabaseRemoteServer.helper
          .insertTransaction(event.previousTransactionValues);
    }
    else if (event is CompleteEvent) {
        DatabaseRemoteServer.helper.updateTransaction(event.previousTransactionValues);
        }
      
    } 
        

    
    
    
    
  
}

//////////////////////////////////////////////////////////////////////////////////////

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  Transaction previousNote;
  UpdateState({required this.previousNote});
}