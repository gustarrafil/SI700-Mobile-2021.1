import 'package:cripose/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final LocalAppRouter _localAppRouter = LocalAppRouter();
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _localAppRouter.onGenerateRoute,
    );
  }
}
