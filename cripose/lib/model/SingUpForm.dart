import 'package:flutter/material.dart';

class SingUpForm extends StatelessWidget {
  final GlobalKey<FormState> singupForm = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: singupForm,
      child: Column(
        children: [
          emailFormField(),
          passwordFormField(),
          passwordConfirmationFormField(),
        ],
      ),
    );
  }
}

Widget emailFormField() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(labelText: "E-mail"),
  );
}

Widget passwordFormField() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: 'Password',
    ),
    autofocus: false,
    obscureText: true,
  );
}

Widget passwordConfirmationFormField() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      hintText: 'Confirm password',
    ),
    autofocus: false,
    obscureText: true,
  );
}
