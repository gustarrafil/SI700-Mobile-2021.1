import 'package:cripose/bloc/logic/monitor_db/monitor_db_bloc.dart';
import 'package:cripose/bloc/logic/monitor_db/monitor_db_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/component/HistoryListComponent.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return HistoryListComponent();
  }
}
