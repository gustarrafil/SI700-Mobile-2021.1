import 'package:flutter/material.dart';

class MainTela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Center(
      child: Container(
        color: Colors.red,
      ),
    );*/
        presentationScreen();
  }
}

Widget presentationScreen() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              border: Border.all(color: Colors.black, width: 6)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(49),
              child: Image.asset(
                'assets/images/ulisses.gif',
                width: 200,
              )),
        ),
        Text("Ulisses Martins Dias",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.blueAccent)),
        Text(
          "Eu sou o professor de Programação para Dispositivos Móveis do ano de 2021 da Faculdade de Tecnologia da Unicamp. Meus alunos incluem João Victor Corsi Ferreira, Carolina da Silva Sancho, Gustavo Tarrafil Sousa Pereira, Vitória Sue Imamura",
          style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              letterSpacing: 2,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
