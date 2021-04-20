import 'package:aula3/view/tela1/tela1_main.dart';
import 'package:aula3/view/tela2/tela2_main.dart';
import 'package:flutter/material.dart';

class MainTela6 extends StatefulWidget {
  @override
  _MainTela6State createState() => _MainTela6State();
}

class _MainTela6State extends State<MainTela6> {
  bool crossFaseFirst = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        generateAnimatedCrossFase(),
        Divider(),
        generatedButton(),
      ],
    );
  }

  Widget generateAnimatedCrossFase() {
    return AnimatedCrossFade(
      firstChild: MainTela1(),
      secondChild: MainTela2(),
      crossFadeState:
          crossFaseFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(seconds: 1),
    );
  }

  Widget generatedButton() {
    return RaisedButton(onPressed: () {
      setState(() {
        crossFaseFirst = !crossFaseFirst;
      });
    });
  }
}
