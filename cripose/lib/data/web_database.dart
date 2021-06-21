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
    // notify();
    return [transactionValuesList, idList];
  }

  Future<int> insertTransaction(Transaction transactionValues) async {
    Response response = await _dio.request(this.databaseUrl,
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));
    double wallet =
        response.data[response.data.length - 1]["wallet"].toDouble();
    double alterValue =
        transactionValues.orderPrice * transactionValues.quantity;
    DateTime dateTime = DateTime.now();
    String name = response.data[response.data.length - 1]["userName"];
    await _dio.post(this.databaseUrl,
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "buySell": transactionValues.buySell,
          "currencyPair": transactionValues.currencyPair,
          "orderPrice": transactionValues.orderPrice,
          "quantity": transactionValues.quantity,
          "trigger": transactionValues.trigger,
          "wallet": transactionValues.buySell
              ? wallet - alterValue
              : wallet + alterValue,
          "userName": name,
          "dateTime":
              "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}T${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}.${dateTime.millisecond.toString().padLeft(3, '0')}Z",
          "triggerValue": transactionValues.triggerValue,
          "triggerName": transactionValues.triggerName
        }));
    notify();
    return 1;
  }

  Future<int> updateTransaction(Transaction transactionValues) async {
    // Response response = await _dio.request(this.databaseUrl,
    //     options: Options(method: "GET", headers: {
    //       "Accept": "application/json",
    //     }));
    // int transactionValuesId = response.data[response.data.length - 1]["id"];
    Response response = await _dio.request(this.databaseUrl,
        options: Options(method: "GET", headers: {
          "Accept": "application/json",
        }));

    DateTime dateTime = DateTime.now();
    int transactionValuesId = response.data[response.data.length - 1]["id"];
    await _dio.put(this.databaseUrl + "/$transactionValuesId",
        options: Options(headers: {"Accept": "application/json"}),
        data: jsonEncode({
          "buySell": response.data[response.data.length - 1]["buySell"],
          "currencyPair": response.data[response.data.length - 1]["currencyPair"],
          "orderPrice": response.data[response.data.length - 1]["orderPrice"],
          "quantity": response.data[response.data.length - 1]["quantity"],
          "trigger": response.data[response.data.length - 1]["trigger"],
          "wallet": response.data[response.data.length - 1]["wallet"].toDouble(),
          "userName": response.data[response.data.length - 1]["userName"],
          "dateTime":
              "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}T${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}.${dateTime.millisecond.toString().padLeft(3, '0')}Z",
          "triggerValue": transactionValues.triggerValue,
          "triggerName": transactionValues.triggerName
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
