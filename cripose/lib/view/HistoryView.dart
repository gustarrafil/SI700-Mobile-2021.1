import 'package:flutter/material.dart';
import '../controller/HistoryListComponent.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return screenHistory();
  }
}

Widget screenHistory() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Expanded(child: Container(child: historyListComponent())),
        ],
      ));
}
