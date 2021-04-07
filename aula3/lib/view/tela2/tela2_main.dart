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
                'assets/images/arthur.jpeg',
                height: 200,
                width: 200,
              ),
            )),
        Text(
          "Arthur Briganti Gini",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.black87),
        ),
        Text(
          """Poeta estudioso e analista do mundo, músico e produtor de Hip-Hop.
           Somos o presente e o futuro, aprendendo a cada instante transformando dados em informação e gerando conhecimento, transmitindo nossa filosofia e vivência elevamos a nossa consciência sobre o que podemos fazer para fazer do mundo um lugar melhor para viver.""",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              backgroundColor: Colors.grey.shade50),
        )
      ],
    ),
  );
}
