import 'package:flutter/material.dart';
import 'package:aula01/view/tela1/tela1_main.dart';
import 'package:aula01/view/tela2/tela2_main.dart';

class MainTela6 extends StatefulWidget {
  @override
  _MainTela6State createState() => _MainTela6State();
}

class _MainTela6State extends State<MainTela6> {
  bool crossFadeFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [generateAnimatedCrossFade(), Divider(), generateButton()],
    );
  }

  Widget generateAnimatedCrossFade() {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      firstChild: MainTela1(),
      secondChild: MainTela2(),
      crossFadeState:
          crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget generateButton() {
    return ElevatedButton(
      child: Text("Click me"),
      onPressed: () {
        setState(() {
          crossFadeFirst = !crossFadeFirst;
        });
      },
    );
  }
}
