import 'package:flutter/material.dart';

Widget userWallet() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
            "\$500",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
        ),
    );
}