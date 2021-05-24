import '../bloc/component/ButtonComponents.dart';
import '../bloc/form/SingUpForm.dart';
import 'package:flutter/material.dart';

class SingUpView extends StatelessWidget {
  SingUpView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text("Sign Up"),
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
