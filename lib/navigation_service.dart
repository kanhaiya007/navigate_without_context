import 'package:flutter/material.dart';
import 'package:navigate_without_context/RouteNames.dart';
import 'package:navigate_without_context/main.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatoryKey =
      new GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) {
    return navigatoryKey.currentState.pushNamed(routeName);
  }

  Future<void> navigateToWithArgs(String routeName, String args) {
    return navigatoryKey.currentState.pushNamed(routeName, arguments: args);
  }

  Future<void> openDialog() {
    showDialog(
        context: navigatoryKey.currentContext,
        builder: (_) => AlertDialog(
              title: Text("Dialog"),
              content: Text("Sample Dialog"),
            ));
  }
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.SCREEN1:
        return MaterialPageRoute(builder: (_) => Screen1());
      case RouteNames.SCREEN2:
        var args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => Screen2(
                  title: args,
                ));
    }
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text("Invalid Route"),
              ),
            ));
  }
}
