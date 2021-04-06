import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.white,
          child: Column(
            children: [
              constrainedFitted(),
              Container(
                height: 400,
              ),
              Divider(
                thickness: 5,
              ),
              Container(),
              containerComfirula(),
            ],
          )),
    );
  }
}

Widget constrainedFitted() {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: 80,
      minWidth: 80,
    ),
    child: FittedBox(
      fit: BoxFit.fill,
      child: Text("arthur"),
    ),
  );
}

Widget containerComfirula() {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.circular(30)),
  );
}
