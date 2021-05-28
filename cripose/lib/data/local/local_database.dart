import 'dart:async';
import 'dart:io';
import 'package:cripose/model/TransactionValues.dart';
import 'package:cripose/model/User.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLocalServer {
  static DatabaseLocalServer helper = DatabaseLocalServer._createInstance();
  DatabaseLocalServer._createInstance();

  static Database _database;

  String transactionTable = 'transactionTable';
  String userTable = 'userTable';
  String colUserName = 'name';
  String colUserEmail = 'email';
  String colUserPwd = 'pwd';

  String colId = 'id';

  String colBuySell = 'buySell';
  String colCurrencyPair = 'currencyPair';
  String colTriggerPrice = 'triggerPrice';
  String colOrderPrice = 'orderPrice';
  String colQuantity = 'quantity';
//   String colDateTime = 'dateTime';
  String colWallet = 'wallet';

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  // Iniciando o banco da dados local
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'banquinho.db';

    Database transactionValuesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionValuesDatabase;
  }

  // Criando o schema do local database
  _createDb(Database db, int newVersion) async {
    await db.execute('''
        CREATE TABLE $transactionTable 
          ($colId INTEGER PRIMARY KEY AUTOINCREMENT, 
          $colBuySell BIT, 
          $colCurrencyPair TEXT, 
          $colTriggerPrice DOUBLE, 
          $colOrderPrice DOUBLE, 
          $colQuantity DOUBLE)
        ''');
    // await db.execute(
    //     "CREATE TABLE $userTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colUserName TEXT NOT NULL, $colUserEmail TEXT NOT NULL, $colUserPwd TEXT NOT NULL)");
  }

  /* INSERT DELETE QUERY UPDATE */

  //Insert Transaction
  Future<int> insertTransactionValues(
      TransactionValues transactionValues) async {
    Database db = await this.database;
    int result = await db.insert(transactionTable, transactionValues.toMap(), nullColumnHack: colId);
    // int result2 = await db.rawInsert(
    //     '''INSERT INTO $transactionTable (currencyPair, $colTriggerPrice, $colOrderPrice, $colQuantity)
    //     VALUES(${transactionValues.currencyPair}, ${transactionValues.triggerPrice}, ${transactionValues.orderPrice}, ${transactionValues.quantity})''');
    print(result);
    notify();
    return result;
  }

  // Insert User
  Future<int> insertUser(User user) async {
    Database db = await this.database;
    int result = await db.insert(userTable, user.toMap());
    notify();
    return result;
  }

  // QUERY: retorna tudo o que tem no banco.
  Future<dynamic> getTransactionValuesList() async {
    Database db = await this.database;
    var transactionValuesMapList =
        await db.rawQuery("SELECT * FROM $transactionTable");

    List<TransactionValues> transactionValuesList = [];
    List<int> idList = [];

    for (int i = 0; i < transactionValuesMapList.length; i++) {
      TransactionValues transactionValues =
          TransactionValues.fromMap(transactionValuesMapList[i]);
      transactionValuesList.add(transactionValues);
        idList.add(transactionValuesMapList[i]["id"]);
    }
    
    
    // print(transactionValuesList);
    return [transactionValuesList.reversed.toList(), idList.reversed.toList()];
  }

  getUser(User user) async {
    Database db = await this.database;
    var userMapList = await db.rawQuery("SELECT * FROM $userTable");

    if (userMapList.length == 1) {
      User user = User.fromMap(userMapList[0]);

      return user.email == userMapList[0]["email"] &&
          user.pwd == userMapList[0]["pwd"];
    }
  }

  // Delete
  Future<int> deleteTransaction(int transactionId) async {
    Database db = await this.database;
    int result = await db.rawDelete(
        "DELETE FROM $transactionTable WHERE $colId = $transactionId");
    notify();
    return result;
  }

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

// main() {
//   var response = DatabaseLocalServer.helper.getTransactionValuesList();
//   print(response[0]);
//   var responseUser = DatabaseLocalServer.helper.getUser(user);
//   print(responseUser[0]);
// }
