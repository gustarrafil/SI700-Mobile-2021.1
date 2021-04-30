import 'package:flutter/material.dart';
import '../controller/ButtonComponents.dart';
import '../model/BuyForm.dart';
import '../model/SellForm.dart';
import '../controller/WalletComponent.dart';
import 'BottomSheetView.dart';

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
        // ButtonController.finishBtn(context),
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
          Text("Compra",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
          Switch(
            value: crossFadeFirst,
            onChanged: (value) {
              setState(() {
                crossFadeFirst = value;
              });
            },
            activeColor: Colors.orangeAccent,
          ),
          Text("Venda",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        ],
      )
    ]);
  }



}
