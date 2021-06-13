import 'package:cripose/logic/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text("registro"),
        ),
        body: Column(
          children: <Widget>[registerForm()],
        ),
      );
    });
  }

  Widget registerForm() {
    final GlobalKey<FormState> formKey = new GlobalKey();
    final RegisterUser registerData = new RegisterUser();
    return Form(
        key: formKey,
        child: Column(children: [
          TextFormField(
              initialValue: "",
              keyboardType: TextInputType.emailAddress,
              onSaved: (inValue) {
                registerData.userName = inValue!;
              },
              decoration: InputDecoration(
                  hintText: "none@none.com",
                  labelText: "Username (eMail address)")),
          TextFormField(
              initialValue: "",
              obscureText: true,
              onSaved: (inValue) {
                registerData.pwd = inValue!;
              },
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password")),
          TextFormField(
              initialValue: "",
              keyboardType: TextInputType.text,
              onSaved: (inValue) {
                registerData.pwd = inValue!;
              },
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password")),
          TextFormField(
              initialValue: "",
              keyboardType: TextInputType.text,
              onSaved: (inValue) {
                registerData.pwd = inValue!;
              },
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password")),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<AuthBloc>(context).add(registerData);
                }
              },
              child: Text("Register!"))
        ]));
  }
}
