import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainTela12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      generateSyncButton(context),
      generateAsyncButton(context),
      generateWidgetFromFuture(),
    ]);
  }

  int timeConsumingFunction(context) {
    var fib = fibonacci(44);
    ScaffoldMessenger.of(context)
        .showSnackBar(generateSnackBar("TimeConsumingFunction Finished"));
    return fib;
  }

  Future<int> timeConsumingAsyncFunction(context) async {
    /*
    return Future(() {
      var fib = fibonacci(44);
      ScaffoldMessenger.of(context)
          .showSnackBar(generateSnackBar("TimeConsumingFunction Finished"));
      return fib;
    });
    */
    Future<int> fib = compute(fibonacci, 44);
    /*fib.then((value) => ScaffoldMessenger.of(context).showSnackBar(
        generateSnackBar("TimeConsumingFunction Finished: $value")));*/

    return fib;
  }

  generateSyncButton(context) {
    return ElevatedButton(
      child: Text("Click me ASync"),
      onPressed: () async {
        try {
          var response = await timeConsumingAsyncFunction(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(generateSnackBar("SyncButton Finished: $response"));
        } catch (e) {}
      },
    );
  }

  generateAsyncButton(context) {
    return ElevatedButton(
      child: Text("Click me Sync"),
      onPressed: () {
        var response = timeConsumingFunction(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(generateSnackBar("SyncButton Finished: $response"));
      },
    );
  }

  Future<int> generateFuture() {
    return compute(fibonacci, 44);
  }

  Widget generateWidgetFromFuture() {
    return FutureBuilder(
      future: generateFuture(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Ocorreu um erro");
        } else if (snapshot.hasData) {
          return Text("Snapshot: ${snapshot.data}");
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget generateSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      duration: Duration(
        seconds: 1,
      ),
    );
  }
}

// Exponencial
int fibonacci(n) {
  if (n < 2) {
    return n;
  }
  return fibonacci(n - 2) + fibonacci(n - 1);
}
