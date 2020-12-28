import 'package:bloc_demo/presentation/constants/route_constamts.dart';
import 'package:bloc_demo/presentation/screens/first_screen.dart';
import 'package:bloc_demo/presentation/screens/homepage.dart';
import 'package:bloc_demo/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.HOMEROUTE:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
        break;

      case RouteConstants.FIRSTPAGE:
        return MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );
        break;

      case RouteConstants.SECONDPAGE:
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
        break;
      default:
        return null;
    }
  }
}
