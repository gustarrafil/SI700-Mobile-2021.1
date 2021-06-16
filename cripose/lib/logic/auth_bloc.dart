import 'dart:async';

import 'package:cripose/model/user.dart';
import 'package:cripose/services/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  late String userName;
  late String pwd;
}

class RegisterUser extends AuthEvent {
  late String userName;
  late String pwd;
  late String nome;
  late String wallet;
}

class LoginAnon extends AuthEvent {}

class Logout extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userAccount;
  InnerServerEvent(this.userAccount);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late FirebaseAuthenticationService _authenticationService;
  late StreamSubscription _authStream;
  AuthBloc() : super(Unauthenticated()) {
    _authenticationService = FirebaseAuthenticationService();
    _authStream = _authenticationService.user.listen((UserModel userAccount) {
      add(InnerServerEvent(userAccount));
    });
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event == false) {
        yield Unauthenticated();
      }
      if (event is RegisterUser) {
        await _authenticationService.createUser(
            email: event.userName, pwd: event.pwd);
      } else if (event is LoginAnon) {
        await _authenticationService.signInAnonimo();
      } else if (event is LoginUser) {
        await _authenticationService.signInWithEmail(
            email: event.userName, pwd: event.pwd);
      } else if (event is InnerServerEvent) {
        if (event.userAccount == false) {
          yield Unauthenticated();
        } else {
          yield Authenticated(user: event.userAccount);
        }
      } else if (event is Logout) {
        await _authenticationService.signOut();
        yield Unauthenticated();
      }
    } catch (e) {
      yield AuthError(msg: e.toString());
    }
  }
}

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;
  Authenticated({required this.user});
}

class AuthError extends AuthState {
  final String msg;
  AuthError({required this.msg});
}
