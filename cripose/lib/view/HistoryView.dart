import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/component/HistoryListComponent.dart';

class HistoryView extends StatelessWidget {
  HistoryView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    print(context);
    return HistoryListComponent();
  }
}
