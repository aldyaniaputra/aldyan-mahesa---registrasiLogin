import 'package:flutter/cupertino.dart';
import 'package:none/Consta/route_name.dart';
import 'package:none/Service/Navigation.dart';
import 'package:none/Ui/Models/base_Model.dart';

import '../../locator.dart';

class loginViewModel extends BaseModel{
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToUpView(){
    _navigationService.navigateto(SignUpViewRoute);
  }
}