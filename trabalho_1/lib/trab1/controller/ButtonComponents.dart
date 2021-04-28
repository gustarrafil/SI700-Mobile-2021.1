import 'package:flutter/material.dart';
import '../view/ConfimationTransaction.dart';
import '../view/TriggerView.dart';

class ButtonController {
  static Widget quitBtn() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(onPressed: () {}, child: Text("SAIR")));
  }

  static Widget triggerBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TriggerView()),
              );
            },
            child: Text("GATILHO")),
      ],
    );
  }

  static Widget finishBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              return showBottomSheet(
                  context: context, builder: (_) => bottomSheet(context));
            },

            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ConfirmationView()),
            //   );

            child: Text("FINALIZAR")),
      ],
    );
  }
}
