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
        if (state is InsertState) {
            DatabaseLocalServer.helper.insertTransactionValues(event.transactionValues);
        }
      } else if (event is SubmitSignEvent) {
        if (state is InsertState) {
            DatabaseLocalServer.helper.insertUser(event.user);
        }
      } else if (event is Login) {
            DatabaseLocalServer.helper.getUser(event.user);
            yield DatabaseLocalServer.helper.getUser(event.user) ? UserState() : Error();
      }
    }
  }

