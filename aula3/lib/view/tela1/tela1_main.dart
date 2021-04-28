import 'package:flutter/material.dart';

class MainTela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            contrainedFitted(),
            Divider(
              thickness: 3,
            ),
            containerComFirula(),
            Divider(
              thickness: 3,
            ),
            cardLayout()
          ],
        ),
      ),
    );
  }
}

Widget contrainedFitted() {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minWidth: 60,
      minHeight: 60,
    ),
    child: FittedBox(
      fit: BoxFit.fill,
      child: Text("Ulisses"),
    ),
  );
}

Widget containerComFirula() {
  return Container(
    //width: 200,
    //height: 200,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(40),
      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
      gradient: LinearGradient(
          colors: [Colors.blue, Colors.red, Colors.yellow, Colors.green]),
    ),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Text(
        "Imamura",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    padding: EdgeInsets.all(40),
    margin: EdgeInsets.all(40),
  );
}

Widget cardLayout() {
  return Card(
      child: Column(
        children: [
          Text("Filho Interno"),
          RotatedBox(quarterTurns: 3, child: Text("Paiva Melo"))
        ],
      ),
      color: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}
