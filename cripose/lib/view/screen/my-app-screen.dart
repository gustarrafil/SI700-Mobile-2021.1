import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/view/screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageRemoteBloc, ManageState>(
      listener: (context, state) {},
      child: BlocListener<MonitorBloc, MonitorState>(
          listener: (context, state) {},
          child: TabView(
            title: "Cripose",
          )),
    );
  }
}
