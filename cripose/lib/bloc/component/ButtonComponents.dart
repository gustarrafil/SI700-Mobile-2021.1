import '../../view/AppCripose.dart';
import '../../view/SingupView.dart';
import '../../view/TabBar.dart';
import '../../view/ConfirmationView.dart';
import 'package:flutter/material.dart';
import '../../view/BottomSheetView.dart';
import '../../view/TriggerView.dart';

class ButtonComponents {
  static Widget triggerBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TriggerView()),
              );
            },
            child: Text("TRIGGER")),
      ],
    );
  }

  static Widget finishBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmationView()),
              );
            },
            child: Text("FINISH")),
      ],
    );
  }

  static Widget loginBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppCripose()),
              );
            },
            child: Text("LOGIN")),
      ],
    );
  }

  static Widget logoutBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {},
            child: Text("LOGOUT")),
      ],
    );
  }

  static Widget finishBtnBottomSheet(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              return showBottomSheet(
                  elevation: 20.0,
                  context: context,
                  builder: (context) => bottomSheetView(context));
            },
            child: Text("FINISH")),
      ],
    );
  }

  static Widget backBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("BACK")),
      ],
    );
  }

  static Widget homeBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingUpView(context)),
              );
            },
            child: Text("SIGN IN")),
      ],
    );
  }

  static Widget signUpConfirmationButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.blueGrey[900];
                },
              ),
            ),
            onPressed: () {},
            child: Text("SIGN IN")),
      ],
    );
  }
}
