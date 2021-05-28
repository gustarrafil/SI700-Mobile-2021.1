import 'package:bloc/bloc.dart';
import 'package:cripose/data/local/local_database.dart';
import 'package:cripose/bloc/logic/manage_db/manage_db_event.dart';
import 'package:cripose/bloc/logic/manage_db/manage_db_state.dart';

class ManageLocalBloc extends Bloc<ManageEvent, ManageState> {
  ManageLocalBloc() : super(InsertState());

  @override
  Stream<ManageState> mapEventToState(ManageEvent event) async* {
    if (event is DeleteTransactionEvent) {
      DatabaseLocalServer.helper.deleteTransaction(event.transactionId);
    } else if (event is SubmitTransactionEvent) {
      var response = DatabaseLocalServer.helper
          .insertTransactionValues(event.transactionValues);
      print(response);
    }
  }
}
