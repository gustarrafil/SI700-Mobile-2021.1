import 'package:cripose/logic/auth_bloc.dart';
import 'package:cripose/routes.dart';
import 'package:cripose/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Launcher());
}

class Launcher extends StatelessWidget {
final LocalAppRouter _localAppRouter = LocalAppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: "launcher screen",
        // home: Wrapper(),
        onGenerateRoute: _localAppRouter.onGenerateRoute
      ),
    );
  }
}
