import 'package:flutter/material.dart';

class MainTela3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return presentationScreen3();
  }
}

Widget presentationScreen3() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: ClipRRect(
                        child: Image.asset('assets/images/aws.png')),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ClipRRect(
                        child: Image.asset('assets/images/binance.png')),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cripose",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Gerenciador e criador de posições de compra e venda de criptoativos utilizando a API da Exchange Binance. Para desenvolver o projeto iremos utilizar o AWS Amplify, com ele iremos utilizar o Cognito para autenticação e o DynamoDB para controle do histórico de transações.",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
