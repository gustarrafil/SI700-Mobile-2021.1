import '../view/TabBar.dart';
import 'package:flutter/material.dart';

class AppCripose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: TabBarCripose(context),
      ),
    );
  }
}
