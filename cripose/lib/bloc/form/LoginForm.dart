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
        // return Form(
        //     key: loginForm,
        //     child: Column(
        //         children: [
        //             emailFormField(),
        //             passwordFormField(),
        //         ],
        //     ),
        // );

        return BlocBuilder<ManageLocalBloc, ManageState>(builder: (context, state) {
            
            if (state is InsertState) {
                User user = new User();
                return Form(
                    key: loginForm,
                    child: Column(
                        children: [
                            emailFormField(user),
                            passwordFormField(user),
                        submitButton(user, state, context),
                        ],
                ));
            }
        });
    }

    Widget emailFormField(User user) {
        return TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: "E-mail"),
        );
    }

    Widget passwordFormField(User user) {
        return TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'Password',
            ),
            autofocus: false,
            obscureText: true,
        );
    }

    Widget submitButton(User user, state, context) {
        return ElevatedButton(
            child: Text("Insert Data"),
            onPressed: () {
            if (loginForm.currentState.validate()) {
                loginForm.currentState.save();
                BlocProvider.of<ManageLocalBloc>(context)
                    .add(Login(user: user));
            }
        });
  }
}
