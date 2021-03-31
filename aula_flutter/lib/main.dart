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

List<Widget> retornaCompleto () {
  List<Color> cores = [Colors.yellow, Colors.grey, Colors.black];

    List<Widget> linha_geral;
    List<Widget> colunas = [];
    List<List<Widget>> celulas = [];
    for (int l = 0; l < 5; l++) {
      for (int c = 0; c < 5; c++) {
        colunas.add(Container(
            margin: EdgeInsets.all(2),
            color: Colors.white,
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