import 'package:flutter/material.dart';
import '../bloc/component/ButtonComponents.dart';
import '../bloc/form/BuyForm.dart';
import '../bloc/form/SellForm.dart';
import '../bloc/component/WalletComponent.dart';

class TradeView extends StatefulWidget {
  TradeView(BuildContext context);

  @override
  _TradeViewState createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  bool crossFadeFirst = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [walletComponent()]),
        switchComponent(),
        generateAnimatedCrossFade(),
        ButtonComponents.triggerBtn(context),
        ButtonComponents.finishBtnBottomSheet(context)
      ]),
    );
  }

  Widget generateAnimatedCrossFade() {
    return AnimatedCrossFade(
      duration: Duration(seconds: 1),
      firstChild: Container(
        child: SellForm(),
      ),
      secondChild: Container(
        child: BuyForm(),
      ),
      crossFadeState:
          crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget switchComponent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Buy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          Switch(
            activeTrackColor: Colors.blueGrey[900],
            inactiveTrackColor: Colors.blueGrey[900],
            value: crossFadeFirst,
            onChanged: (value) {
              setState(() {
                crossFadeFirst = value;
              });
            },
            activeColor: Colors.red,
            inactiveThumbColor: Colors.green,
          ),
          Text("Sell",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ],
      )
    ]);
  }
}
