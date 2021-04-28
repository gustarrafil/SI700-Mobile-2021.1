import 'package:flutter/material.dart';

class MainTela8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [generateTable()],
    );
  }

  Widget generateTable() {
    return Table(
      columnWidths: {2: FixedColumnWidth(80)},
      border: TableBorder(
          top: BorderSide(width: 5),
          bottom: BorderSide(width: 2),
          left: BorderSide(width: 2),
          right: BorderSide(width: 7),
          horizontalInside: BorderSide(width: 1, color: Colors.blue),
          verticalInside: BorderSide(width: 1, color: Colors.red)),
      children: [
        generateRow(["Leticia", "Wong", "21"], true),
        generateRow(["Arthur", "Gini", "30"], false),
        generateRow(["Leonardo", "Teixeira", "16"], true)
      ],
    );
  }

  TableRow generateRow(List<String> celulas, bool wantDecoration) {
    List<Widget> row = [];
    for (String celula in celulas) {
      row.add(Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(celula)));
    }
    return TableRow(
        children: row,
        decoration: wantDecoration ? BoxDecoration(color: Colors.grey) : null);
  }
}
