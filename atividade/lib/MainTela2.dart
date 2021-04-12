import 'package:flutter/material.dart';

class MainAba2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return presentationScreen();
  }
}

Widget presentationScreen() {
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
                Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/social_media.png')),
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
                      "Gustavo Tarrafil Sousa Pereira",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "RA 159740",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Aluno de Sistemas de informação tentando terminar o curso. Tentando ser UX dev. Atualmente trabalhando no Itaú no desenvolvimento de sistemas de monitoração de canais de atendimento do banco, focado na versão web com Flask e Bootstrap. Não gosta de Java mas acha Flutter bonito, apesar se ainda ser um pouco confuso no geral. Falta prática.",
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
