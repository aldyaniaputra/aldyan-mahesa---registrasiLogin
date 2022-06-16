import 'package:flutter/material.dart';
import 'package:none/Service/Navigation.dart';
import 'package:none/Ui/router.dart';
import 'package:none/Ui/View/loginViewWidget.dart';
import 'package:none/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: loginViewWidget(),
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}

