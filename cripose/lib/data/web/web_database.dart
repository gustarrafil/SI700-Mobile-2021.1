import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cripose/model/TransactionValues.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DatabaseRemoteServer {
  /* 
    Criando singleton
  */
  static DatabaseRemoteServer helper = DatabaseRemoteServer._createInstance();
  DatabaseRemoteServer._createInstance();

  String databaseUrl =
      "https://server-test-aula-mobile.herokuapp.com/transactions";

  Dio _dio = Dio();

  Future<List<dynamic>> getTransactionValuesList() async {
    Response response = await _dio.request(this.databaseUrl,
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    List<TransactionValues> transactionValuesList = [];
    List<int> idList = [];

    response.data.forEach((element) {
      TransactionValues transactionValues = TransactionValues.fromMap(element);
      transactionValuesList.add(transactionValues);
      idList.add(element["id"]);
    });

    return [transactionValuesList, idList];
  }

  Future<int> insertTransaction(TransactionValues transactionValues) async {
    await _dio.post(this.databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "currencyPair": transactionValues.currencyPair,
          "orderPrice": transactionValues.orderPrice,
          "quantity": transactionValues.quantity
        }));
    return 1;
  }

  Future<int> updateTransaction(
      int transactionValuesId, TransactionValues transactionValues) async {
    await _dio.put(this.databaseUrl + "/$transactionValuesId",
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "currencyPair": transactionValues.currencyPair,
          "orderPrice": transactionValues.orderPrice,
          "quantity": transactionValues.quantity
        }));
    return 1;
  }

  Future<int> deleteTransaction(int transactionValuesId) async {
    await _dio.delete(this.databaseUrl + "/$transactionValuesId",
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    return 1;
  }

  /*
    STREAM
  */
  notify() async {
    if (_controller != null) {
      var response = await getTransactionValuesList();
      _controller.sink.add(response);
    }
  }

  Stream get stream {
    if (_controller == null) {
      _controller = StreamController();

      Socket socket = io(
          "https://server-test-aula-mobile.herokuapp.com/",
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              .build());
      socket.on('invalidate', (_) => notify());
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

// void main() async {
//   DatabaseRemoteServer noteService = DatabaseRemoteServer.helper;
//   /*
//   var response = await noteService.getNoteList();
//   Note note = response[0][0];
//   print(note.title);
//   */

//   TransactionValues note = TransactionValues();
//   note.currencyPair = "BRL";
//   note.orderPrice = 23.6;
//   note.quantity = 34.7;
//   noteService.insertTransaction(note);
//   //noteService.updateNote(0, note);
//   //noteService.deleteNote(1);
// }
