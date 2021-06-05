import 'package:cripose/bloc/logic/manage_db/manage_db.dart';
import 'package:cripose/bloc/logic/monitor_db/monitor_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/component/ButtonComponents.dart';
import '../bloc/form/BuyForm.dart';
import '../bloc/form/SellForm.dart';
import '../bloc/component/WalletComponent.dart';

class TradeView extends StatelessWidget {
  TradeView(BuildContext context);
  bool crossFadeFirst = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(builder: (context, state) {
        // print(state.changeFalse);
        // print(state.changeTrue);
        if (state.changeFalse == null && state.changeTrue != null) {
            crossFadeFirst = true;
        }
        else if (state.changeFalse != null && state.changeTrue == null) {
            crossFadeFirst = false;
        }
        print(crossFadeFirst);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: []), // get wallet
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Buy",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                    Switch(
                      activeTrackColor: Colors.blueGrey[900],
                      inactiveTrackColor: Colors.blueGrey[900],
                      value: crossFadeFirst,
                      onChanged: (value) {
                        // setState(() {
                        //     crossFadeFirst = value;

                        // });
                        // criar bloc novo?
                        // BlocProvider(create: (_) => MonitorBloc());
                        // print(value);
                        BlocProvider.of<MonitorBloc>(context)
                            .add(ChangeForm(change: value));
                      },
                      activeColor: Colors.red,
                      inactiveThumbColor: Colors.green,
                    ),
                    Text("Sell",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                  ],
                )
              ]),
                AnimatedCrossFade(
                    duration: Duration(milliseconds: 300),
                    firstChild: Container(
                        child: SellForm(),
                    ),
                    secondChild: Container(
                        child: BuyForm(),
                    ),
                    crossFadeState: 
                        crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    )

            ]),
      );
    });
  }
}

// class TradeView extends StatefulWidget {
//   TradeView(BuildContext context);

//   @override
//   _TradeViewState createState() => _TradeViewState();
// }

// class _TradeViewState extends State<TradeView> {
//   bool crossFadeFirst = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child:
//           Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [walletComponent()]),
//         switchComponent(),
//         generateAnimatedCrossFade(),
//         // ButtonComponents.triggerBtn(context),
//         // ButtonComponents.finishBtnBottomSheet(context)
//       ]),
//     );
//   }

//   Widget generateAnimatedCrossFade() {
//     return AnimatedCrossFade(
//       duration: Duration(seconds: 1),
//       firstChild: Container(
//         child: SellForm(),
//       ),
//       secondChild: Container(
//         child: BuyForm(),
//       ),
//       crossFadeState:
//           crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//     );
//   }

//   Widget switchComponent() {
//     return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text("Buy",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
//           Switch(
//             activeTrackColor: Colors.blueGrey[900],
//             inactiveTrackColor: Colors.blueGrey[900],
//             value: crossFadeFirst,
//             onChanged: (value) {
//               setState(() {
//                 crossFadeFirst = value;
//               });
//             },
//             activeColor: Colors.red,
//             inactiveThumbColor: Colors.green,
//           ),
//           Text("Sell",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
//         ],
//       )
//     ]);
//   }
// }
