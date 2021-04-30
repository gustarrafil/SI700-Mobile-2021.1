import 'package:cripose/view/AppCripose.dart';
import 'package:cripose/view/LoginView.dart';
import 'package:cripose/view/SingupView.dart';
import 'package:cripose/view/TabBar.dart';

import '../view/ConfirmationView.dart';
import 'package:flutter/material.dart';
import '../view/BottomSheetView.dart';
import '../view/TriggerView.dart';

class ButtonComponents {
  static Widget triggerBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TriggerView()),
              );
            },
            child: Text("GATILHO")),
      ],
    );
  }

  static Widget finishBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmationView()),
              );
            },
            child: Text("FINALIZAR")),
      ],
    );
  }

  static Widget loginBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppCripose()),
              );
            },
            child: Text("ENTRAR")),
      ],
    );
  }

  static Widget logoutBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => LoginView()),
              //   );
            },
            child: Text("SAIR")),
      ],
    );
  }

  static Widget finishBtnBottomSheet(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              return showBottomSheet(
                  elevation: 20.0,
                  context: context,
                  builder: (context) => bottomSheetView(context));
            },
            child: Text("FINALIZAR")),
      ],
    );
  }

  static Widget backBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("VOLTAR")),
      ],
    );
  }

  static Widget homeBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabBarCripose(context)),
              );
            },
            child: Text("OK")),
      ],
    );
  }

  static Widget singupButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingUpView(context)),
              );
            },
            child: Text("CADASTRO")),
      ],
    );
  }

  static Widget signUpConfirmationButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(onPressed: () {}, child: Text("CADASTRO")),
      ],
    );
  }
}
