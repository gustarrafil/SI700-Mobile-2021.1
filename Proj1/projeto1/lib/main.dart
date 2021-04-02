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
  Matriz matriz = Matriz();
  var pronto_volta = matriz.caminhoThor(thor, martelo);

  /*  return Matriz.linha
        .map(
          (columns) => Column(
            children: columns.map((nr) => nr).toList(),
          ),
        )
        .toList();
  */
  List<Widget> teste = [
    Icon(
      Icons.stop_rounded,
      color: Colors.black,
      size: 40.0,
    ),
    Icon(
      Icons.stop_rounded,
      color: Colors.black,
      size: 40.0,
    ),
  ];
  return teste;
}

List<int> chegaPerto(List<int> thor, int eixo, int novo) {
  thor.removeAt(eixo);
  thor.insert(eixo, novo);
  if (thor != null) return thor;
}

// retorna quadrado pintado dentro do incremento do caminho

class Matriz {
  List<Widget> coluna;
  List<List<Widget>> linha = [];

  // Primeira chamada = Gera o caminho que o Thor Percorrera
  List<List<int>> caminhoThor(List<int> thor, List<int> martelo) {
    int thorX = thor[0];
    int thorY = thor[1];
    int marteloX = martelo[0];
    int marteloY = martelo[1];

    List<List<int>> lista_caminho = [];

    if (thorX == marteloX && thorY == marteloY) {
      List<List<int>> local_igual = [];
      return local_igual = [
        [thorX, thorY],
        [marteloX, marteloY]
      ];
    } else {
      while (thorX < marteloX) {
        thorX += 1;
        lista_caminho.add(chegaPerto(thor, 0, thorX));
        print(lista_caminho);
      }
      while (thorX > marteloX) {
        thorX -= 1;
        lista_caminho.add(chegaPerto(thor, 0, thorX));
        print(lista_caminho);
      }
      while (thorY < marteloY) {
        thorY += 1;
        lista_caminho.add(chegaPerto(thor, 0, thorY));
        print(lista_caminho);
      }
      while (thorY > marteloY) {
        thorY -= 1;
        lista_caminho.add(chegaPerto(thor, 0, thorY));
        print(lista_caminho);
      }
    }

    print(lista_caminho);
    return lista_caminho;
  }

  criaMatriz(List<int> thor, List<int> martelo, List<List<int>> lista_caminho) {
    int tamanhoC = thor[0] > martelo[0] ? thor[0] : martelo[0];
    int tamanhoL = thor[1] > martelo[1] ? thor[1] : martelo[1];

    for (int c = 0; c < tamanhoC; c++) {
      for (int l = 0; l < tamanhoL; l++) {
        coluna = [];
        List<List<int>> localThor = caminhoThor(thor, martelo);
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
      if (item[0] == c && item[1] == l) {
        return Colors.black;
      } else {
        return Colors.blue;
      }
    }
  }
}
