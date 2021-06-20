import 'package:cripose/logic/auth_bloc.dart';
import 'package:cripose/view/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthenticationScreenStatex();
  }
}

class _AuthenticationScreenStatex extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
          title: Text("Access account"),
        ),
        body: Padding(
          padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: <Widget>[signInFormulario()],
          ),
        ),
      );
    });
  }

  Widget signInFormulario() {
    final GlobalKey<FormState> formKey = new GlobalKey();
    final LoginUser loginData = new LoginUser(); // evento;
    return Form(
        key: formKey,
        child: Column(children: [
          TextFormField(
              initialValue: "",
              keyboardType: TextInputType.emailAddress,
              onSaved: (inValue) {
                loginData.userName = inValue!;
              },
              decoration: InputDecoration(
                  hintText: "john@doe.com",
                  labelText: "e-mail address")),
          TextFormField(
              initialValue: "",
              obscureText: true,
              onSaved: (inValue) {
                loginData.pwd = inValue!;
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
                    BlocProvider.of<AuthBloc>(context).add(loginData);
                  }
                },
                child: Text("LOGIN")),
          ),
          SizedBox(
              width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(LoginAnon());
                },
                child: Text("ANONYMOUS")),
          ),
          SizedBox(
              width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text("CREATE USER")),
          ),
        ]));
  }
}
