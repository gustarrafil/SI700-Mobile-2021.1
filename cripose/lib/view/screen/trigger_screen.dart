import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/view/form/trigger_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriggerView extends StatefulWidget {
  const TriggerView({Key? key}) : super(key: key);

  @override
  _TriggerViewState createState() => _TriggerViewState();
}

class _TriggerViewState extends State<TriggerView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text("Trigger"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: <Widget>[TriggerForm()],
          ),
        ),
      );
    });
  }
}

// Navigator.of(context).pushNamed("/");
