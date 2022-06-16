import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:none/Consta/route_name.dart';
import 'package:none/Ui/View/camera_view.dart';
import 'package:none/Ui/View/signUpView.dart';
import 'package:none/Ui/View/loginViewWidget.dart';

Route<dynamic> generateRoute (RouteSettings settings){
  switch(settings.name){
    case loginViewRoute:
      return _pageRoute(
          routeName: settings.toString(),
          viewToShow: loginViewWidget()
      );
    case CameraViewRoute:
      return _pageRoute(
          routeName: settings.name!,
          viewToShow: CameraView()
      );
    case SignUpViewRoute:
      return _pageRoute(
          routeName: settings.toString(),
          viewToShow: signUpView());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'no route difine ${settings.name}',)
        ),
      )
      );
  }
}
PageRoute _pageRoute({required String routeName, required Widget viewToShow}){
  return MaterialPageRoute(builder: (_) => viewToShow,
      settings: RouteSettings(
        name: routeName,

      ),
  );
}