import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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



