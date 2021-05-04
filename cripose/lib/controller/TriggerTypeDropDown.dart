import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String _chosenType;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: DropdownButton<String>(
          value: _chosenType,
          items: <String>[
            'Greater than',
            'Greater or equal than',
            'Less than',
            'Less or equal than',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text("Trigger type"),
          onChanged: (String value) {
            setState(() {
              _chosenType = value;
            });
          },
        ),
      )
    ]);
  }
}
