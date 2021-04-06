import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return presentationScreen();
  }
}

Widget presentationScreen() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                border: Border.all(color: Colors.black, width: 5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(49),
              child: Image.asset(
                'assets/images/img.jpg',
                height: 150,
              ),
            )),
        Text(
          "Arthur Briganti Gini",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.blueAccent),
        ),
        Text(
          "Eu sou arthur gini dshduahudshaudhau",
          style: TextStyle(fontSize: 20, color: Colors.blue),
        )
      ],
    ),
  );
}
