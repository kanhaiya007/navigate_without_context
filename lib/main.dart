import 'package:flutter/material.dart';
import 'package:navigate_without_context/RouteNames.dart';
import 'package:navigate_without_context/locator_service.dart';
import 'package:navigate_without_context/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatoryKey,
      title: "Navigation Without Context",
      home: MainScreen(),
      onGenerateRoute: GenerateRoute.generateRoute,
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(RouteNames.SCREEN1);
              },
              child: Text("Screen1"),
            ),
            RaisedButton(
              onPressed: () {
                locator<NavigationService>()
                    .navigateToWithArgs(RouteNames.SCREEN2, "Sample Title");
              },
              child: Text("Screen2"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          locator<NavigationService>().openDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("Screen1"),
    ));
  }
}

class Screen2 extends StatelessWidget {
  final String title;

  Screen2({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text("$title"),
    ));
  }
}
