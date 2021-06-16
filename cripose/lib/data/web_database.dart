import 'dart:async';
import 'dart:convert';
import 'package:cripose/model/transaction.dart';
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
    List<Transaction> transactionValuesList = [];
    List<int> idList = [];

    response.data.forEach((element) {
      Transaction transactionValues = Transaction.fromMap(element);
      transactionValuesList.add(transactionValues);
      idList.add(element["id"]);
    });

    return [transactionValuesList, idList];
  }

  Future<int> insertTransaction(Transaction transactionValues) async {
    DateTime dateTime = DateTime.now();
    await _dio.post(this.databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "buySell": transactionValues.buySell,
          "currencyPair": transactionValues.currencyPair,
          "orderPrice": transactionValues.orderPrice,
          "quantity": transactionValues.quantity,
          "dateTime":
              "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}T${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}.${dateTime.millisecond.toString().padLeft(3, '0')}Z",
          //   "triggerValue": transactionValues.triggerValue
        }));
    return 1;
  }

  // Future<int> updateTransaction(
  //     int transactionValuesId, Transaction transactionValues) async {
  //   await _dio.put(this.databaseUrl + "/$transactionValuesId",
  //       options: Options(headers: {"Accept": "application/json"}),
  //       data: jsonEncode({
  //         "buySell": transactionValues.buySell,
  //         "currencyPair": transactionValues.currencyPair,
  //         "orderPrice": transactionValues.orderPrice,
  //         "quantity": transactionValues.quantity,
  //         //   "triggerValue": transactionValues.triggerValue
  //       }));
  //   return 1;
  // }

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
      _controller = StreamController.broadcast();

      Socket socket = io("https://server-test-aula-mobile.herokuapp.com/",
          OptionBuilder().setTransports(['websocket']).build());
      socket.on('invalidate', (_) => notify());
    }
    return _controller.stream.asBroadcastStream();
  }

  dispose() {
    if (!_controller.hasListener) {
      _controller.close();
      _controller = StreamController<dynamic>();
    }
  }

  static StreamController _controller = StreamController();
}
