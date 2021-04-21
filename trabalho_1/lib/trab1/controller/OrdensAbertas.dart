import './UltimosTrades.dart';
import 'package:flutter/material.dart';

Widget ordensAbertas() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                Text("Ordens abertas",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 100.0,
                    child: listaTrades()
                )
            ],
        ),
    );
}