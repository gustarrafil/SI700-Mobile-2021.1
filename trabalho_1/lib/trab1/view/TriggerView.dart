import 'package:flutter/material.dart';
import 'ConfirmationView.dart';

class TriggerView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Second Route"),
            ),
            body: Center(
                child: Column(
                    children: [
                        ElevatedButton(
                            onPressed: () {
                                Navigator.pop(context);
                            },
                            child: Text('Go back!'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ConfirmationView()),
                                );
                            },
                            child: Text('Go front!'),
                        ),
                    ],
                ),
            ),
        );
    }
}