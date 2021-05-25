import '../bloc/component/ConfirmationComponent.dart';
import 'package:flutter/material.dart';

// class Bottom extends StatelessWidget {
//   Bottom(BuildContext context);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: MediaQuery.of(context).size.height * 0.6,
//         decoration: new BoxDecoration(
//           color: Colors.white,
//         ),
//         child:
//             Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//           Text("Transaction",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
//           ConfirmationComponent(),
//           Column(
//             children: [
//               Text("Do you want to confirm the transaction?",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
//               ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                         return Colors.blueGrey[900];
//                       },
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     final snackBar = SnackBar(
//                       content: Text('Order finished with success!'),
//                     );
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   },
//                   child: Text("CONFIRM TRANSACTION")),
//             ],
//           )
//         ]));
//   }
// }

Widget bottomSheetView(BuildContext context) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("Transaction",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        ConfirmationComponent(),
        Column(
          children: [
            Text("Do you want to confirm the transaction?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.blueGrey[900];
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  final snackBar = SnackBar(
                    content: Text('Order finished with success!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("CONFIRM TRANSACTION")),
          ],
        )
      ]));
}
