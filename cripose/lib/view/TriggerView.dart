import '../controller/ButtonComponents.dart';
import '../model/TriggerForm.dart';
import 'package:flutter/material.dart';
import 'ConfirmationView.dart';



class TriggerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                title: Text("Trigger configuration"),
            ),
            body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
Column(
  children: [
        Container(child: TriggerForm()),
  ],
),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                    Navigator.pop(context);
                                },
                                child: Text('Go back!'),
                            ),
                            ButtonController.finishBtn(context)
                          ],
                        ),
                    ],
                ),
            ),
        );
  }
}