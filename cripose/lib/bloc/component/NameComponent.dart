import 'UserNameComponent.dart';
import 'package:flutter/material.dart';

Widget nameComponent() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      (new UserName()).name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    ),
  );
}
