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
// marteloThor([5, 2], [4, 7]);
// marteloThor([9, 7], [11, 3]);
// marteloThor([5, 7], [-5, -3]);

caminho (List<int> thor, List<int> martelo) {
  var pronto_volta = retornaCompleto(thor, martelo);

  return pronto_volta
      .map(
        (columns) => Column(
          children: columns.map((nr) => nr).toList(),
        ),
      )
      .toList();

}

List<List<Widget>> retornaCompleto(List<int> thor, List<int> martelo) {
  List<Color> cores = [Colors.yellow, Colors.grey, Colors.black];

  List<Widget> linha_geral;
  List<Widget> celulas = [];
  List<List<Widget>> colunas = [];

  for (int l = 0; l < (thor[1] > martelo[1] ? thor[1] : martelo[1]); l++) {
    for (int c = 0; c < (thor[0] > martelo[0] ? thor[0] : martelo[0]); c++) {
      List<int> local_final = marteloThor(thor, martelo);
      int x = local_final[0];
      int y = local_final[1];
      if (l == x || c == y) {
        celulas.add(Container(
          margin: EdgeInsets.all(2),
          child: Icon(
            Icons.stop_rounded,
            color: cores[0],
            size: 30.0,
          ),
        ));
      } else {
        celulas.add(Container(
          margin: EdgeInsets.all(2),
          child: Icon(
            Icons.stop_rounded,
            color: cores[2],
            size: 30.0,
          ),
        ));
      }
    }
    colunas.add(celulas);
    celulas = [];
  }


  return colunas; 
}

List<int> marteloThor(List<int> thor, List<int> martelo) {
  int thorX = thor[0];
  int thorY = thor[1];
  int marteloX = martelo[0];
  int marteloY = martelo[1];

  if (thorX == marteloX && thorY == marteloY) {
    return thor;
  }
  while (thorX < marteloX) {
    thorX += 1;
    return chegaPerto(thor, 0, thorX);
  }
  while (thorX > marteloX) {
    thorX -= 1;
    return chegaPerto(thor, 0, thorX);
  }
  while (thorY < marteloY) {
    thorY += 1;
    return chegaPerto(thor, 1, thorY);
  }
  while (thorY > marteloY) {
    thorY -= 1;
    return chegaPerto(thor, 1, thorY);
  }
  
}

List<int> chegaPerto(List<int> thor, int eixo, int novo) {
  thor.removeAt(eixo);
  thor.insert(eixo, novo);
  return thor;
}



