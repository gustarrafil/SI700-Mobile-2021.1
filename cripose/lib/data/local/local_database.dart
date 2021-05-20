import 'dart:async';
import 'dart:io';
import 'package:cripose/model/TransactionValues.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();
  DatabaseLocalServer._createInstance();

  static Database _database;
  static StreamController _controller;

  String transactionTable = 'transactionTable';
  String transactionId = 'id';
  String currencyPair = 'Btc/usdt';
  double triggerPrice = 50.000;
  double orderPrice = 49.999;
  double quantity = 0.003;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // Iniciando o banco da dados local
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'transactions.db';

    Database transactionDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionDatabase;
  }

  // Criando o schema do local database
  _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $transactionTable ($transactionId INTEGER PRIMARY KEY AUTOINCREMENT,$currencyPair TEXT ,$triggerPrice DOUBLE, $orderPrice DOUBLE, $quantity DOUBLE) ");
  }

  //Insert
  Future<int> insertTransaction(TransactionValues transaction) async {
    Database db = await this.database;
    int result = await db.insert(transactionTable, transaction.toMap());
    notify();
    return result;
  }

  // Query
  Future<List<dynamic>> getTransactionList() async {
    Database db = await this.database;
    var transactionMapList =
        await db.rawQuery("SELECT * FROM $transactionTable");

    List<TransactionValues> listTransaction = [];
    List<int> idList = [];

    for (int i = 0; i < transactionMapList.length; i++) {
      TransactionValues transactionValues =
          TransactionValues.fromMap(transactionMapList[i]);
      listTransaction.add(transactionValues);
      idList.add(transactionMapList[i]['id']);
    }
    return [transactionMapList, idList];
  }

  // Todo:
  // Update (Acredito que nao rola fazer um update pela natureza da ordem)
  // Se vc enviou uma ordem nao da pra atualizar ela, apenas excluir e gerar outra...
  // Future<int> updateTransaction (int transactionId,TransactionValues transation) async{}

  // Delete
  // Nao tenho certeza como bater esse id com o do banco entao
  Future<int> deleteTransaction(int transactionId) async {
    Database db = await this.database;
    int result = await db.rawDelete(
        'DELETE FROM $transactionTable where $transactionId = $transactionId');
    notify();
    return result;
  }

  // Stream
  notify() async {
    if (_controller != null) {
      var response = await getTransactionList();
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
}
