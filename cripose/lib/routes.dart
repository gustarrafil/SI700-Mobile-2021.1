// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LocalAppRouter {
//   // Telas Home e Second
//   CounterBloc _counterBloc1 = CounterBloc();

//   // Tela Third
//   CounterBloc _counterBloc2 = CounterBloc();

//   /*
//    Método com assinatura a ser memorizada
//   */
//   Route onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case "/":
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterBloc1,
//                   child: MyHomePage(title: "Primeira Página"),
//                 ));
//       case "/second":
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterBloc1,
//                   child: MySecondPage(title: "Segunda Página"),
//                 ));

//       case "/third":
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider.value(
//                   value: _counterBloc2,
//                   child: MyThirdPage(title: "Terceira Página"),
//                 ));
//       default:
//         return null;
//     }
//   }

//   void dispose() {
//     _counterBloc1.close();
//     _counterBloc2.close();
//   }
// }
