import 'package:flutter/material.dart';
import 'package:aula01/model/login.dart';

class MainTela3 extends StatelessWidget {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //color: Colors.green,
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
          return "Insira um nome de usuário";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.username = inValue;
      },
      decoration: InputDecoration(
          hintText: "user@domain.br", labelText: "Username (E-mail Address)"),
    );
  }

  Widget passwordFormField() {
    return TextFormField(
      obscureText: true,
      validator: (String inValue) {
        if (inValue.length < 10) {
          return "Mínimo de 10 letras";
        }
        return null;
      },
      onSaved: (String inValue) {
        loginData.password = inValue;
      },
      decoration: InputDecoration(labelText: "Insira uma senha forte"),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text("Log In!"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          loginData.doSomething();
        }
      },
    );
  }

  Widget submitButtonWithConfirmation() {
    return ElevatedButton(
      child: Text("Log In with Confirmation!"),
      onPressed: () async {
        if (formKey.currentState.validate()) {
          await showDialog(
              context: formKey.currentContext,
              builder: (_) => generateConfirmationDialog(),
              barrierDismissible: false);
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
      title: Text("Confirmation Required"),
      content: Text("Você tem certeza de que gostaria de salvar?"),
      actions: [
        TextButton(
          child: Text("Sim"),
          onPressed: () {
            loginData.confirmed = true;
            Navigator.of(formKey.currentContext).pop();
          },
        ),
        TextButton(
          child: Text("Não"),
          onPressed: () {
            loginData.confirmed = false;
            Navigator.of(formKey.currentContext).pop();
          },
        ),
      ],
      backgroundColor: Colors.cyan[100],
      elevation: 20,
      //shape: CircleBorder()
    );
  }
}
