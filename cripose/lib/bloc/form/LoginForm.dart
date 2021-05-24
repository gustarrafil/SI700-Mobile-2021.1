import 'package:cripose/bloc/component/ButtonComponents.dart';
import 'package:cripose/bloc/logic/manage_db/manage_db_event.dart';
import 'package:cripose/bloc/logic/manage_db/manage_db_state.dart';
import 'package:cripose/bloc/logic/manage_db/manage_local_db_bloc.dart';
import 'package:cripose/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> loginForm = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginForm,
      child: Column(
        children: [
          emailFormField(),
          passwordFormField(),
          ButtonComponents.singupButton(context)
        ],
      ),
    );
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


}
