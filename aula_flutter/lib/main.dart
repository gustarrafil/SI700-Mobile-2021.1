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
              children: caminho([9, 7], [11, 3]),
            ),
          ],
        ));
  }
}

//////////////////////////////////////////
// caminho([5, 2], [4, 7]);
// caminho([9, 7], [11, 3]);
// caminho([5, 7], [-5, -3]);
//
//FLUXO:
// caminhoThor([9, 7], [11, 3]);
// class MAtriz
//      Verificar a cor
// criaMatriz

caminho(List<int> thor, List<int> martelo) {
  var thor_inicial = List.of(thor);
  var martelo_inicial = List.of(martelo);
  Matriz matriz = Matriz();
  var pronto_volta = matriz;
  var caminho_thor = pronto_volta.caminhoThor(thor, martelo);
  pronto_volta.criaMatriz(thor_inicial, martelo_inicial, caminho_thor);



  return pronto_volta.linha.map(
          (columns) => Column(
            children: columns.toList(),
          ),
        )
        .toList();
}

class Matriz {
  List<Widget> coluna;
  List<List<Widget>> linha = [];

  // Primeira chamada = Gera o caminho que o Thor Percorrera
  List<List<int>> caminhoThor(List<int> thor, List<int> martelo) {

    List<List<int>> lista_caminho = [];

    if (thor[0] == martelo[0] && thor[1] == martelo[1]) {
      List<List<int>> local_igual = [];
      return local_igual = [
        [thor[0], thor[1]],
        [martelo[0], martelo[1]]
      ];
    } else {
      while (thor[0] < martelo[0]) {
        thor[0] += 1;
        lista_caminho.add(List.from(thor));
      }
      while (thor[0] > martelo[0]) {
        thor[0] -= 1;
        lista_caminho.add(List.from(thor));
      }
      while (thor[1] < martelo[1]) {
        thor[1] += 1;
        lista_caminho.add(List.from(thor));
      }
      while (thor[1] > martelo[1]) {
        thor[1] -= 1;
        lista_caminho.add(List.from(thor));
      }
    }

    print(lista_caminho);
    return lista_caminho;
  }

  criaMatriz(List<int> thor, List<int> martelo, List<List<int>> lista_caminho) {
    int tamanhoC = thor[0] > martelo[0] ? thor[0] : martelo[0];
    int tamanhoL = thor[1] > martelo[1] ? thor[1] : martelo[1];

    for (int l = 0; l < tamanhoL; l++) {
      coluna = [];
      for (int c = 0; c < tamanhoC; c++) {
        coluna.add(Container(
          margin: EdgeInsets.all(4),
          child: Icon(
            Icons.stop_rounded,
            color: verificaCor(lista_caminho, c + 1, l + 1),
            size: 40.0,
          ),
        ));
      }
      linha.add(coluna);
    }
  }

  Object verificaCor(List<List<int>> lista_caminho, int c, int l) {
    for (var item in lista_caminho) {
      if (item[0] == c || item[1] == l) {
        return Colors.black;
      } else {
        return Colors.blue;
      }
    }
  }
}
