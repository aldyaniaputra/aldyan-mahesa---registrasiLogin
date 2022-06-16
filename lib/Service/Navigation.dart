import 'package:flutter/material.dart';

class NavigationService{
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop(){
    return _navigationKey.currentState?.pop();
  }
  void popWithValue(String value){
    return _navigationKey.currentState?.pop(value);
  }
  Future<dynamic>? navigateto(String routeName,{dynamic argumen}){
    return _navigationKey.currentState?.pushNamed(routeName,arguments: argumen);
  }
  Future<dynamic>? naviagateToWithData(String routeName,data,{dynamic argumen}){
    return _navigationKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}//akhir Class