import 'package:flutter_bloc/flutter_bloc.dart';

// ORGANIZAR QUAIS SERAO OS ESTADOS POSSIVEIS DE ACORDO COM TELAS E ABAS

// STATE PRO SWITCH??
// STATE PRO GRAFICO??

enum StateMachineEvent {
    loginEvent, 
    registerEvent, 
    userEvent, 
    tradeEvent, 
    triggerEvent, 
    bottomConfirmationEvent, 
    confirmationEvent, 
    historyEvent
}
enum StateMachineState {
    LoginState, 
    RegisterState, 
    UserState, 
    TradeState, 
    TriggerState, 
    BottomConfirmationState, 
    ConfirmationState, 
    HistoryState, 
    Error
}


class StateMachineBloc extends Bloc<StateMachineEvent, StateMachineState> {
  StateMachineBloc() : super(StateMachineState.LoginState);

  @override
  Stream<StateMachineState> mapEventToState(StateMachineEvent event) async* {
      switch(event) {

        case StateMachineEvent.registerEvent:
            if(state == StateMachineState.LoginState) {
                yield StateMachineState.RegisterState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.loginEvent:
            if(state == StateMachineState.RegisterState) {
                yield StateMachineState.LoginState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.userEvent:
            if(state == StateMachineState.LoginState) {
                yield StateMachineState.UserState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.tradeEvent:
            if(state == StateMachineState.UserState) {
                yield StateMachineState.TradeState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.historyEvent:
            if(state == StateMachineState.UserState) {
                yield StateMachineState.HistoryState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.userEvent:
            if(state == StateMachineState.HistoryState) {
                yield StateMachineState.UserState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.tradeEvent:
            if(state == StateMachineState.HistoryState) {
                yield StateMachineState.TradeState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.bottomConfirmationEvent:
            if(state == StateMachineState.TradeState) {
                yield StateMachineState.BottomConfirmationState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.tradeEvent:
            if(state == StateMachineState.BottomConfirmationState) {
                yield StateMachineState.TradeState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.triggerEvent:
            if(state == StateMachineState.TradeState) {
                yield StateMachineState.TriggerState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.confirmationEvent:
            if(state == StateMachineState.TriggerState) {
                yield StateMachineState.ConfirmationState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        case StateMachineEvent.userEvent:
            if(state == StateMachineState.ConfirmationState) {
                yield StateMachineState.UserState;
            } else {
                yield StateMachineState.Error;
            }
          break;
        
        
      }
  }
    
}