import 'package:flutter/material.dart';

class MainTela9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [createDataTable()],
    );
  }

  Widget createDataTable() {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 0,
      columns: [
        DataColumn(label: Text("Nome"), onSort: (columnIndex, ascending) {}),
        DataColumn(label: Text("Sobrenome")),
        DataColumn(label: Text("Idade"))
      ],
      rows: [createDataRow(), createDataRow(), createDataRow()],
    );
  }

  DataRow createDataRow() {
    return DataRow(cells: [
      DataCell(Text("Henrique")),
      DataCell(Text("Shigihara")),
      DataCell(
        Text("22"),
        placeholder: true,
        showEditIcon: true,
        onTap: () {},
      )
    ]);
  }
}
