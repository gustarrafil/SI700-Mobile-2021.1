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
            backgroundColor: Colors.blueGrey[900],
          title: Text("Create user"),
        ),
        body: Padding(
          padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: <Widget>[registerForm()],
          ),
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
                  hintText: "john@doe.com",
                  labelText: "e-mail address")),
          TextFormField(
              initialValue: "",
              obscureText: true,
              onSaved: (inValue) {
                registerData.pwd = inValue!;
              },
              decoration:
                  InputDecoration(hintText: "password", labelText: "password")),
          SizedBox(
              width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    BlocProvider.of<AuthBloc>(context).add(registerData);
                  }
                },
                child: Text("REGISTER")),
          )
        ]));
  }
}
