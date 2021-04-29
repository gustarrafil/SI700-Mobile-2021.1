import '../controller/HistoryItem.dart';
import 'package:flutter/material.dart';

Widget historyListComponent() {
  const int itemsQtt = 20;
  const double cardElevation = 10;

  return ListView.builder(
      itemCount: itemsQtt,
      itemBuilder: (context, index) {
        return Card(
            color: Colors.amber[100],
            elevation: cardElevation,
            child: ListTile(
                title: HistoryItem(),
                onTap: () {
                  
                },
            )
        );
      });
}
