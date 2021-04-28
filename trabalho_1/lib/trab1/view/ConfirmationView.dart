import 'package:flutter/material.dart';
import '../view/TabBar.dart';

class ConfirmationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //         Navigator.pop(context);
            //     },
            //     child: Text('Go back!'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TabBarCripose(context)),
                );
              },
              child: Text('go home'),
            ),
          ],
        ),
      ),
    );
  }
}
