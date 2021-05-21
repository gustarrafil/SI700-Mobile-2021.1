import '../view/ChartView.dart';
import '../controller/HistoryItem.dart';
import 'package:flutter/material.dart';

Widget historyListComponent() {
  const int itemsQtt = 20;
  const double cardElevation = 10;

  return ListView.builder(
      itemCount: itemsQtt,
      itemBuilder: (context, index) {
        return Card(
            color: Colors.blueGrey[100],
            elevation: cardElevation,
            child: ListTile(
              title: HistoryItem(),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 450),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ChartView()],
                            ),
                          ),
                        ),
                      );
                    });
              },
            ));
      });
}
