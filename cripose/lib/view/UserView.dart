import 'package:cripose/bloc/component/NameComponent.dart';
import 'package:cripose/bloc/component/WalletComponent.dart';
import 'package:flutter/material.dart';
import '../bloc/component/ButtonComponents.dart';
import '../bloc/component/OrdersController.dart';
import '../bloc/component/NameComponent.dart';

class UserView extends StatelessWidget {
  UserView(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return screenUser(context);
  }
}

Widget screenUser(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameComponent(),
              walletComponent(),
            ],
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Last orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              OrdersController(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Open orders",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              OrdersController(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ButtonComponents.logoutBtn(context)],
          ),
        ]),
  );
}
