import 'package:flutter/material.dart';

class MainTela7 extends StatefulWidget {
  @override
  _MainTela7State createState() => _MainTela7State();
}

class _MainTela7State extends State<MainTela7> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.red];
  List<double> sizes = [10, 20, 50, 100];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        generateAnimatedDefaultTextStyle(),
        Divider(),
        generatedButton(),
      ],
    );
  }

  Widget generateAnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      duration: Duration(seconds: 1),
      style: TextStyle(
        color: colors[_index % colors.length],
        fontSize: sizes[_index % sizes.length],
      ),
      child: null,
    );
  }

  Widget generatedButton() {
    return RaisedButton(onPressed: () {
      setState(() {
        _index += 1;
        print(_index);
      });
    });
  }
}
