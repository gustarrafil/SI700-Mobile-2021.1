import 'package:aula3/model/login.dart';
import 'package:flutter/cupertino.dart';
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
          return "Insira um nome de usuario";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.username = inValue;
      },
      decoration: InputDecoration(
          hintText: "user@domain.br", labelText: "Username/E-mail"),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      // keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String inValue) {
        if (inValue.length <= 6) {
          return "Minimo de 6 caracteres";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.password = inValue;
      },
      decoration: InputDecoration(
          hintText: "Password", labelText: "Password (6 caracteres)"),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text("Login"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          loginData.doSomething();
        }
      },
    );
  }

  Widget submitButtonWithConfirmation() {
    // Retorna o nome do usuario pq ele salva o nome depois de chamar a tela de confirmação
    return RaisedButton(
      child: Text("Longin in With Confirmation"),
      onPressed: () async {
        if (formKey.currentState.validate()) {
          await showDialog(
              // Showdialog se declarou async pq pode levar tempo, dizendo que pode continuar processando
              context: formKey.currentContext,
              builder: (_) => generateConfirmationDialog(),
              barrierDismissible: true);
          if (loginData.confirmed) {
            formKey.currentState.save();
            loginData.doSomething();
            loginData.confirmed = false;
          }
        }
      },
    );
  }

  Widget generateConfirmationDialog() {
    return AlertDialog(
      title: Text("Cofirmation required !"),
      content: Text(
          "Voce tem certeza de que gostaria de salvar ${loginData.username} ? "),
      actions: [
        FlatButton(
          child: Text("Sim"),
          onPressed: () {
            loginData.confirmed = true;
            Navigator.of(formKey.currentContext).pop();
          },
        ),
        FlatButton(
          child: Text("Nao"),
          onPressed: () {
            loginData.confirmed = false;
            Navigator.of(formKey.currentContext).pop();
          },
        ),
      ],
      backgroundColor: Colors.cyan.shade50,
      elevation: 30, //Coloca sombra
    );
  }
}
