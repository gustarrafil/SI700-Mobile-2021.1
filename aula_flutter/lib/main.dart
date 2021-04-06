// Authores:
// Arthur Briganti Gini RA: 213253
// Gustavo Tarrafil     RA: 159740

import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//////////////////////////////////////////  QUASE SEMPRE ASSIM
class MyHomePage extends StatefulWidget {
  // construtor
  MyHomePage({Key key, this.title}) : super(key: key);
  // atributo
  final String title;
  // CreateState
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}
//////////////////////////////////////////

////////////////////////////// ALTERACAOD DE ESTADO QUE ACONTECE NO STATEFUL
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Caminho do Thor"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: retornaCompleto(),
            ),
          ],
        )
    );
  }
}
//////////////////////////////////////////

class Matriz {
  List<Widget> coluna;
  List<List<Widget>> linha = [];

  construir(List<int> thor, List<int> martelo) {
    int largura = thor[POSICAO_X] > martelo[POSICAO_X]
        ? thor[POSICAO_X]
        : martelo[POSICAO_X];
    int altura = thor[POSICAO_Y] > martelo[POSICAO_Y]
        ? thor[POSICAO_Y]
        : martelo[POSICAO_Y];

    List<List<int>> listaModelo = passagem(thor, martelo);
    print(listaModelo);

    // for (var item in listaModelo) {
    for (int l = 1; l <= altura; l++) {
      coluna = [];
      for (int c = 1; c <= largura; c++) {
        Widget celula;
        List<int> lugar = [c, l];
        for (var item in listaModelo) {
          // print("${item[POSICAO_X]} $c ${item[POSICAO_Y]} $l");
          if (item[POSICAO_X] == c && item[POSICAO_Y] == l) {
            celula = Container(
              margin: EdgeInsets.all(4),
              child: Icon(
                Icons.stop_rounded,
                color: Colors.black,
                size: 40.0,
              ),
            );
          } else {
            celula = Container(
              margin: EdgeInsets.all(4),
              child: Icon(
                Icons.stop_rounded,
                color: cores[0],
                size: 30.0,
            ),
        ));
      }
      celulas.add(colunas);
      colunas = [];
    }

    return linha_geral = celulas
        .map(
          (columns) => Column(
            children: columns.map((nr) {
              return Container(
                margin: EdgeInsets.all(2),
                color: Colors.white,
                child: Icon(
                  Icons.stop_rounded,
                  color: cores[1],
                  size: 30.0,
                ),
              );
            }).toList(),
          ),
        )
        .toList();
  }
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// caminho([5, 2], [4, 7]);
// caminho([9, 7], [11, 3]);
// caminho([5, 7], [-5, -3]);
//
//FLUXO:
// caminhoThor([9, 7], [11, 3]);
// class MAtriz
//      Verificar a cor
// criaMatriz

// caminho(List<int> thor, List<int> martelo) {
//   var thor_inicial = List.of(thor);
//   var martelo_inicial = List.of(martelo);

//   Matriz matriz = Matriz();
//   var matriz_linha = matriz;
//   var caminho_thor = matriz_linha.caminhoThor(thor, martelo);
//   matriz_linha.criaMatriz(thor_inicial, martelo_inicial, caminho_thor);

//   return matriz_linha.linha
//       .map(
//         (coluna) => Column(
//           children: coluna.toList(),
//         ),
//       )
//       .toList();
// }

// class Matriz {
//   List<Widget> coluna;
//   List<List<Widget>> linha = [];

//   // Primeira chamada = Gera o caminho que o Thor Percorrera
//   List<List<int>> caminhoThor(List<int> thor, List<int> martelo) {
//     List<List<int>> lista_caminho = [];

//     if (thor[0] == martelo[0] && thor[1] == martelo[1]) {
//       List<List<int>> local_igual = [];
//       return local_igual = [
//         [thor[0], thor[1]],
//         [martelo[0], martelo[1]]
//       ];
//     } else {
//       while (thor[0] < martelo[0]) {
//         thor[0] += 1;
//         lista_caminho.add(List.from(thor));
//       }
//       while (thor[0] > martelo[0]) {
//         thor[0] -= 1;
//         lista_caminho.add(List.from(thor));
//       }
//       while (thor[1] < martelo[1]) {
//         thor[1] += 1;
//         lista_caminho.add(List.from(thor));
//       }
//       while (thor[1] > martelo[1]) {
//         thor[1] -= 1;
//         lista_caminho.add(List.from(thor));
//       }
//     }

//     print(lista_caminho);
//     return lista_caminho;
//   }

//   criaMatriz(List<int> thor, List<int> martelo, List<List<int>> lista_caminho) {
//     int tamanhoC = thor[0] > martelo[0] ? thor[0] : martelo[0];
//     int tamanhoL = thor[1] > martelo[1] ? thor[1] : martelo[1];

//     for (int l = 0; l < tamanhoL; l++) {
//       coluna = [];
//       for (int c = 0; c < tamanhoC; c++) {
//         coluna.add(Container(
//           margin: EdgeInsets.all(4),
//           child: Icon(
//             Icons.stop_rounded,
//             color: verificaCor(l +1, c+1, lista_caminho),
//             size: 40.0,
//           ),
//         ));
//       }
//       linha.add(coluna);
//     }
//   }

//   Object verificaCor(int l, int c, List<List<int>> listaCaminho) {
//     for (var item in listaCaminho) {
//       return item[0] == c && item[1] == l ? Colors.black : Colors.blue;
//     }
//   }

// }
