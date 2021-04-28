import 'package:flutter/material.dart';

class MainTela5 extends StatefulWidget {
  @override
  _MainTela5State createState() => _MainTela5State();
}

class _MainTela5State extends State<MainTela5> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.red];
  List<double> size = [100, 200, 300, 400];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      generateAnimatedContainer(),
      Divider(),
      generateButton(),
    ]);
  }

  Widget generateAnimatedContainer() {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        color: colors[_index % colors.length],
        width: size[_index % size.length],
        height: size[_index % size.length],
        child: Text("Vitoria Sue Imamura"));
  }

  Widget generateButton() {
    return ElevatedButton(
      child: Text("Click me"),
      onPressed: () {
        setState(() {
          _index += 1;
          print(_index);
        });
      },
    );
  }
}
