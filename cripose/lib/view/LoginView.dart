import 'package:cripose/controller/ButtonComponents.dart';
import 'package:cripose/model/LoginForm.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                LoginForm(),
                ButtonComponents.loginBtn(context),
                ButtonComponents.singupButton(context)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
