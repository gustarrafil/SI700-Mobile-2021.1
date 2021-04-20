import 'package:flutter/material.dart';

class MainTela8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }

  Widget generateTable() {
    return Table(
      columnWidths: {2: FixedColumnWidth(80)},
      border: TableBorder(
        top: BorderSide(width: 5),
        bottom: BorderSide(width: 2),
        left: BorderSide(width: 3),
        right: BorderSide(width: 2),
        horizontalInside: BorderSide(width: 1, color: Colors.blue),
        verticalInside: BorderSide(width: 1, color: Colors.amber),
      ),
      children: [
        generateRow(["Leticia", "whog", "21"]),
        generateRow(["arthur", "whog", "21"]),
        generateRow(["Gustava", "whog", "21"]),
      ],
    );
  }

  TableRow generateRow(List<String> celulas) {
    List<Widget> row = [];
    for (String celula in celulas) {
      row.add(Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(celula),
      ));
    }
    return TableRow(children: row);
  }
}
