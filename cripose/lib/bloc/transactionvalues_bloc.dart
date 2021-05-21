import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'transactionvalues_event.dart';
part 'transactionvalues_state.dart';

class TransactionvaluesBloc extends Bloc<TransactionvaluesEvent, TransactionvaluesState> {
  TransactionvaluesBloc() : super(TransactionvaluesInitial());

  @override
  Stream<TransactionvaluesState> mapEventToState(
    TransactionvaluesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
