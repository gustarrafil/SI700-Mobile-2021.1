import 'package:cripose/logic/auth_bloc.dart';
import 'package:cripose/view/screen/login_screen.dart';
import 'package:cripose/view/screen/my-app-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class Wrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return either the Home or Authenticate widget
//     return SignIn();
//   }
// }

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MyApp();
    // return AuthenticationScreen();
    return BlocConsumer<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
        if (state is Authenticated) {
            return MyApp();
        }
        else {
            return AuthenticationScreen();
        }
    },
    listener: (context, state) {
        if (state is AuthError) {
            showDialog(context: context, builder: (context) {
                return AlertDialog(title: Text("erro server"), content: Text("${state.msg}"),actions: [
                    ElevatedButton(onPressed: () {
                        Navigator.of(context).pop();
                    }, child: Text("ok"))
                ],);
            });
        }
    },
    );
  }
}