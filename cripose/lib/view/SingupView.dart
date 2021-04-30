import 'package:cripose/controller/ButtonComponents.dart';
import 'package:cripose/model/SingUpForm.dart';
import 'package:flutter/material.dart';
import 'package:cripose/model/LoginForm.dart';

class SingUpView extends StatelessWidget {
  SingUpView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Cadastrar:"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              SingUpForm(),
              ButtonComponents.signUpConfirmationButton()
            ]),
          ],
        ),
      ),
    );
  }
}
