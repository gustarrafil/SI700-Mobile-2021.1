import 'package:cripose/view/AppCripose.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'FlutterApp',
     debugShowCheckedModeBanner: true,
     home: AppCripose(),);
  }
}