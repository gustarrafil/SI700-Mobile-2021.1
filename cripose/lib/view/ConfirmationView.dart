import '../bloc/component/ButtonComponents.dart';
import '../bloc/component/ConfirmationComponent.dart';
import 'package:flutter/material.dart';

class ConfirmationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text("Confirmation"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Order finished with success!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26))
                  ],
                ),
                ConfirmationComponent(),
                ButtonComponents.homeBtn(context),
              ]),
        ));
  }
}
