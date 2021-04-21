import '../controller/ListaHistorico.dart';
import 'package:flutter/material.dart';

class TelaHistory extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return screenHistory();
    }
}


Widget screenHistory() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: listaHistorico()
    );
}



