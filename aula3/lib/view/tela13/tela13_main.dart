import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MainTela13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        generateListenButton(context),
      ],
    );
  }

  Widget generateListenButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          NumberStreamCreator numberStreamCreator = NumberStreamCreator();

          Stream<int> numberStream = numberStreamCreator.stream;

          await Future.delayed(Duration(seconds: 10));

          numberStream.listen((event) {
            ScaffoldMessenger.of(context)
                .showSnackBar(generateSnackBar("Received: $event"));
          });
          // Linha abaixo vai dar um erro.
          //numberStream.listen((event) {});
        },
        child: Text("Listen Stream"));
  }

  Widget generateSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: Duration(
        seconds: 1,
      ),
    );
  }
}

class NumberStreamCreator {
  int _count = 1;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  NumberStreamCreator() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _controller.sink.add(_count);
      _count++;

      if (_count > 10) {
        timer.cancel();
        _controller.close();
      }
    });
  }
}

Stream<int> enviaDados() async* {
  var rng = new Random();
  for (int i = 1; i <= 10; i++) {
    var seconds = rng.nextInt(10);
    await Future.delayed(Duration(seconds: seconds));
    yield i;
  }
}
