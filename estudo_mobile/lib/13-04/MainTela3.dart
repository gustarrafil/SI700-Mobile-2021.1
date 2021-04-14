import 'package:aula_flutter/13-04/model/login.dart';
import 'package:flutter/material.dart';

class MainTela3 extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              usernameFormField(),
              passwordFormField(),
              submitButton(),
              submitButtonWithConfirmation()
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (String inValue) {
        if (inValue.length == 0) {
          return "insira um nome de usuario";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.username = inValue;
      },
      decoration: InputDecoration(
          hintText: "user@domain.br", labelText: "username (email address)"),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String inValue) {
        if (inValue.length < 10) {
          return "minimo 10 char";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.password = inValue;
      },
      decoration: InputDecoration(labelText: "insira senha forte"),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          loginData.doSomething();
          // doSomething será enviar pra algum lugar
        }
      },
      child: Text("login"),
    );
  }

  Widget submitButtonWithConfirmation() {
    return RaisedButton(
      onPressed: () async {
        if (formKey.currentState.validate()) {
          await showDialog(
              context: formKey.currentContext,
              builder: (_) => generateConfirmationDialog(),
              barrierDismissible: false);

          if (loginData.confirmed) {
            formKey.currentState.save();
            // doSomething será enviar pra algum lugar
            loginData.doSomething();
            loginData.confirmed = false;
          }
        }
      },
      child: Text("confirme o login"),
    );
  }

  Widget generateConfirmationDialog() {
    return AlertDialog(
      title: Text("confirmation required"),
      content: Text("tem ctz?"),
      actions: [
        FlatButton(
            onPressed: () {
              loginData.confirmed = true;
              //navigator.of pra tela sumir
              Navigator.of(formKey.currentContext).pop();
            },
            child: Text("sim")),
        FlatButton(
            onPressed: () {
              loginData.confirmed = false;
              //navigator.of pra tela sumir
              Navigator.of(formKey.currentContext).pop();
            },
            child: Text("nao")),
      ],
      backgroundColor: Colors.cyan[100],
      elevation: 20,
      //   shape: CircleBorder(),
    );
  }
}
