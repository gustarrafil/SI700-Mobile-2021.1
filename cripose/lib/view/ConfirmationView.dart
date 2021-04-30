
import 'package:cripose/controller/ButtonComponents.dart';

import '../controller/ConfirmationComponent.dart';
import 'package:flutter/material.dart';
import '../view/TabBar.dart';

class ConfirmationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Column(children: [Text("ordem feita com sucesso!")],),
                ConfirmationComponent(),
            ButtonComponents.homeBtn(context),
            ]
        ),
    )
    );
  }
}
