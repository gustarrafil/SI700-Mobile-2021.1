import '../bloc/component/WalletComponent.dart';
import '../bloc/component/ButtonComponents.dart';
import '../bloc/form/TriggerForm.dart';
import 'package:flutter/material.dart';

class TriggerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Trigger configuration"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                walletComponent(),
                Container(child: TriggerForm()),
              ],
            ),
            Column(
              children: [
                ButtonComponents.backBtn(context),
                ButtonComponents.finishBtn(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}