import 'package:flutter/material.dart';

import 'view/bottom_navigation_bar.dart';
import 'view/tab_bar_layout.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return MyTabBarLayout();
    //return MyBottomNavigationBar();
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: MyNavigationDrawerLayout());
  }
}

class MyNavigationDrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation Drawer")),
      body: Container(),
      drawer: Drawer(child: generateListViewDrawerLayout(context)),
    );
  }

  Widget generateListViewDrawerLayout(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("Gabriel Gomes Gonçalves",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          decoration: BoxDecoration(color: Colors.purple),
        ),
        ListTile(
            leading: Icon(Icons.cake),
            title: Text("BottomNavigation"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyBottomNavigationBar();
              }));
            }),
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("TabBarLayout"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyTabBarLayout();
              }));
            })
      ],
    );
  }
}
