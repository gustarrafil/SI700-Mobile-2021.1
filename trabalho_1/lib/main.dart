/*
 * Arthur Briganti Gini 213253
 * Gustavo Tarrafil Sousa Pereira 159740
 */

// import '13-04/tab_bar.dart';
// import 'package:flutter/material.dart';

// void main() {
//     runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//     @override
//     Widget build(BuildContext context) {
//         return MyTabBarLayout();
//     }
// }

import 'package:flutter/material.dart';
import 'trab1/tab.dart';

void main() {
    runApp(AppCripose());
}

class AppCripose extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return TabBarCripose();
    }
}