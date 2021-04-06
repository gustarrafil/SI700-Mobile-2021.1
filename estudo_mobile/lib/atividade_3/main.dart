import 'tab_bar.dart';

import 'BottomBar.dart';
import 'package:flutter/material.dart';


void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // return BottomBar();
        return MyTabBarLayout();
    }
}
