import 'package:flutter/material.dart';

Widget userName() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
            "Gustavo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
        ),
    );
}