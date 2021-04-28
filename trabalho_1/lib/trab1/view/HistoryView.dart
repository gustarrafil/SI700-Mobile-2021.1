import 'package:flutter/material.dart';
import '../controller/HistoryListComponent.dart';

class HistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return screenHistory();
  }
}

Widget screenHistory() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: historyListComponent());
}

// cada item da lista manda o nome da moeda e quando clicar ele abre um grafico com historico atualizado de valor absoluto da moeda na carteira
