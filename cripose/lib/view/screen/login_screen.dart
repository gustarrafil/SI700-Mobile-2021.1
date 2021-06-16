import 'package:cripose/logic/auth_bloc.dart';
import 'package:cripose/services/auth.dart';
import 'package:cripose/view/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   final AuthService _auth = AuthService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("sei la")),
//       body: Container(
//         child: ElevatedButton(
//             onPressed: () async {
//               dynamic result = await _auth.signInAnon();
//               if (result == null) {
//                 print('Error signing');
//               } else {
//                 print('Sucess');
//                 print(result.uid);
//               }
//             },
//             child: Text("botao")),
//       ),
//     );
//   }
// }

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
          title: Text("entrar"),
        ),
        body: Column(
          children: <Widget>[signInFormulario()],
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
                  hintText: "none@none.com",
                  labelText: "Username (eMail address)")),
          TextFormField(
              initialValue: "",
              obscureText: true,
              onSaved: (inValue) {
                loginData.pwd = inValue!;
              },
              decoration:
                  InputDecoration(hintText: "Password", labelText: "Password")),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<AuthBloc>(context).add(loginData);
                }
              },
              child: Text("SignIn!")),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoginAnon());
              },
              child: Text("SignInAnônimo!")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text("Registrar")),
        ]));
  }
}
