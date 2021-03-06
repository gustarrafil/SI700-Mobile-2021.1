import 'package:cripose/logic/manage_db.dart';
import 'package:cripose/logic/monitor_db.dart';
import 'package:cripose/view/screen/trigger_screen.dart';
import 'package:cripose/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalAppRouter {
  ManageRemoteBloc _manageBloc = ManageRemoteBloc();
  MonitorBloc _monitorBloc = MonitorBloc();

  /*
   Método com assinatura a ser memorizada
  */
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _monitorBloc,
              ),
              BlocProvider.value(
                value: _manageBloc,
              ),
            ],
            child: Wrapper(),
          );
        });
      case "/gatilho":
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _monitorBloc,
              ),
              BlocProvider.value(
                value: _manageBloc,
              ),
            ],
            child: TriggerView(),
          );
        });
      default:
        return null;
    }
  }

  void dispose() {
    _manageBloc.close();
    _monitorBloc.close();
  }
}
