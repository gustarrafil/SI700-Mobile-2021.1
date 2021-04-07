import 'package:aula3/view/bottom_navigation_bar.dart';
import 'package:aula3/view/tab_bar_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  // Duas opções de navegacao:
  Widget build(BuildContext context) {
    // return MyBottomNavigationBar();
    return MyTabBarLayout();
  }
}
