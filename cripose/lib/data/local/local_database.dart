import 'dart:async';
import 'dart:io';
import 'package:cripose/model/TransactionValues.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();
  DatabaseLocalServer._createInstance();

  static Database _database;

  String transactionTable = 'transactionTable';

  String colId = 'id';

  String colBuySell = 'buySell';
  String colCurrencyPair = 'currencyPair';
  String colTriggerPrice = 'triggerPrice';
  String colOrderPrice = 'orderPrice';
  String colQuantity = 'quantity';
  String colDateTime = 'dateTime';

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // Iniciando o banco da dados local
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'transactionValues.db';

    Database transactionValuesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionValuesDatabase;
  }

  // Criando o schema do local database
  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $transactionTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colBuySell BIT NOT NULL, $colCurrencyPair TEXT NOT NULL, $colTriggerPrice DOUBLE, $colOrderPrice DOUBLE, $colQuantity DOUBLE NOT NULL, $colDateTime DATETIME  NOT NULL)");
  }

    /* INSERT DELETE QUERY UPDATE */

  //Insert
  Future<int> insertTransactionValues(TransactionValues transactionValues) async {
    Database db = await this.database;
    int result = await db.insert(transactionTable, transactionValues.toMap());
    notify();
    return result;
  }

    // QUERY: retorna tudo o que tem no banco.
  getTransactionValuesList() async {
    Database db = await this.database;
    var transactionValuesMapList = await db.rawQuery("SELECT * FROM $transactionTable");

    List<TransactionValues> transactionValuesList = [];
    List<int> idList = [];

    for (int i = 0; i < transactionValuesMapList.length; i++) {
      TransactionValues transactionValues = TransactionValues.fromMap(transactionValuesMapList[i]);
      transactionValuesList.add(transactionValues);
      idList.add(transactionValuesMapList[i]["id"]);
    }
    return [transactionValuesList, idList];
  }


  // Todo:
  // Update (Acredito que nao rola fazer um update pela natureza da ordem)
  // Se vc enviou uma ordem nao da pra atualizar ela, apenas excluir e gerar outra...
  // Future<int> updateTransaction (int transactionId,TransactionValues transation) async{}

  // Delete
  // nao precisaria ter delete no banco local
  // Nao tenho certeza como bater esse id com o do banco entao
//   Future<int> deleteTransaction(int transactionId) async {
//     Database db = await this.database;
//     int result = await db.rawDelete(
//         'DELETE FROM $transactionTable where $transactionId = $transactionId');
//     notify();
//     return result;
//   }

  // Stream
  notify() async {
    if (_controller != null) {
      var response = await getTransactionValuesList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = null;
    }
  }

  static StreamController _controller;
}

main() {
  var response = DatabaseLocalServer.helper.getTransactionValuesList();
  print(response[1]);
}
