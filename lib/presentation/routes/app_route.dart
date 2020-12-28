import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:bloc_demo/presentation/constants/route_constamts.dart';
import 'package:bloc_demo/presentation/screens/first_screen.dart';
import 'package:bloc_demo/presentation/screens/homepage.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.HOMEROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: HomePage(),
          ),
        );
        break;

      case RouteConstants.FIRSTPAGE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: FirstScreen(),
          ),
        );
        break;

      case RouteConstants.SECONDPAGE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(),
          ),
        );
        break;
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
